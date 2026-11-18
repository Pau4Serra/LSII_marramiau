package com.tecnocampus.LS2.protube_back.persistance;

import com.tecnocampus.LS2.protube_back.model.CommentLike;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface CommentLikeRepository extends JpaRepository<CommentLike, UUID> {

    Optional<CommentLike> findByComment_IdAndUser_Id(UUID commentId, UUID userId);

    @Transactional
    long deleteByComment_IdAndUser_Id(UUID commentId, UUID userId);

    @Query("""
            select commentLike.comment.id as commentId, count(commentLike) as likeCount
            from CommentLike commentLike
            where commentLike.comment.id in :commentIds
            group by commentLike.comment.id
            """)
    List<CommentLikeCount> countLikesByCommentIdIn(
            @Param("commentIds") Collection<UUID> commentIds);

    @Query("""
            select commentLike.comment.id
            from CommentLike commentLike
            where commentLike.comment.id in :commentIds
              and commentLike.user.id = :userId
            """)
    List<UUID> findCommentIdsLikedByUser(
            @Param("commentIds") Collection<UUID> commentIds,
            @Param("userId") UUID userId);

    interface CommentLikeCount {
        UUID getCommentId();

        long getLikeCount();
    }

}
