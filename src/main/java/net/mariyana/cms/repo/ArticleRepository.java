package net.mariyana.cms.repo;

import net.mariyana.cms.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ArticleRepository extends JpaRepository<Article, Long>{
    List<Article> getAllByUserId(Long id);
}
