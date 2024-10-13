package com.hoangtien2k3.shopappbackend.responses.comment;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.hoangtien2k3.shopappbackend.models.Comment;
import com.hoangtien2k3.shopappbackend.responses.user.UserCommentsResponse;
import com.hoangtien2k3.shopappbackend.responses.user.UserResponse;
import com.hoangtien2k3.shopappbackend.utils.DateUtil;
import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentResponse {
    @JsonProperty("content")
    private String content;

    // user's infomation
    @JsonProperty("user")
    private UserCommentsResponse userResponse;

    @JsonProperty("updated_at")
    private String updatedAt;

    public static CommentResponse fromComment(Comment comment) {
        return CommentResponse.builder()
                .content(comment.getContent())
                .userResponse(UserResponse.fromUserComments(comment.getUser()))
                .updatedAt(DateUtil.date2ddMMyyyyString(comment.getUpdatedAt()))
                .build();
    }
}
