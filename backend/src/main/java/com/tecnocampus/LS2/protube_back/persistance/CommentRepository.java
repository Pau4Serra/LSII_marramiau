package com.tecnocampus.LS2.protube_back.persistance;

import com.tecnocampus.LS2.protube_back.model.Comment;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface CommentRepository extends JpaRepository<Comment, UUID> {

    @EntityGraph(attributePaths = {"author", "replies", "replies.author"})
    List<Comment> findByVideo_IdAndParentIsNullOrderByCreatedAtDesc(UUID videoId);

    @Query("""
            select comment from Comment comment
            left join fetch comment.video
            left join fetch comment.author
            left join fetch comment.parent
            where comment.id = :commentId
            """)
    Optional<Comment> findDetailedById(@Param("commentId") UUID commentId);

}
