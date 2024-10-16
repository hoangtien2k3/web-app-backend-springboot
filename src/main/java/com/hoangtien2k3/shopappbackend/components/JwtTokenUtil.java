package com.hoangtien2k3.shopappbackend.components;

import com.hoangtien2k3.shopappbackend.models.Token;
import com.hoangtien2k3.shopappbackend.repositories.TokenRepository;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Slf4j
@Component
@RequiredArgsConstructor
public class JwtTokenUtil {

    private final TokenRepository tokenRepository;

    @Value("${jwt.expiration}")
    private int expiration;

    @Value("${jwt.expiration-refresh-token}")
    private int refreshTokenExpiration;

    @Value("${jwt.secretKey}")
    private String secretKey;

    public String generateToken(UserDetails userDetails) {
        return generateToken(new HashMap<>(), userDetails);
    }

    // generate token using jwt utility class and return token as string
    public String generateToken(Map<String, Object> extractClaims, UserDetails userDetails) {
        try {
            long now = System.currentTimeMillis();
            Date issuedAt = new Date(now);
            Date expirationDate = new Date(now + expiration * 1000L);
            String token = Jwts
                    .builder()
                    .setClaims(extractClaims)
                    .setSubject(userDetails.getUsername())
                    .setIssuedAt(issuedAt)
                    .setExpiration(expirationDate)
                    .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                    .compact();

            log.info("Generated Token: {}", token);
            log.info("Current Time: {}", new Date());
            log.info("Token Issued At: {}", issuedAt);
            log.info("Token Expiration Time: {}", expirationDate);

            return token;
        } catch (Exception e) {
            log.error("Token generation error: {}", e.getMessage());
            return null;
        }
    }


    // decode and get the key
    private Key getSignInKey() {
        // decode SECRET_KEY
        byte[] keyBytes = Decoders.BASE64.decode(secretKey);
        return Keys.hmacShaKeyFor(keyBytes);
    }

    private Claims extractAllClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(getSignInKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    public <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }


    // if token is valid by checking if token is expired for current user
    public boolean isTokenValid(String token, UserDetails userDetails) {
        final String phoneNumber = extractPhoneNumber(token);
        Token existingToken = tokenRepository.findByToken(token);
        if (existingToken == null
                || existingToken.isRevoked()
                || !existingToken.getUser().isActive()
        ) {
            return false;
        }
        return phoneNumber.equals(userDetails.getUsername()) && !isTokenExpirated(token);
    }

    // extract user from token
    public String extractPhoneNumber(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    // if token expirated
    public boolean isTokenExpirated(String token) {
        return extractExpiration(token).before(new Date());
    }

    // get expiration data from token
    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    //ngay het han access token
    public Date getTokenExpirationDate() {
        return new Date(System.currentTimeMillis() + expiration * 1000L);
    }

    //ngay het han refresh token
    public Date getRefreshTokenExpirationDate() {
        return new Date(System.currentTimeMillis() + refreshTokenExpiration * 1000L);  // expiration tính bằng giây
    }
}
