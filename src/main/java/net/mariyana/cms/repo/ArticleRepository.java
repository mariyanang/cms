package net.mariyana.cms.repo;

import net.mariyana.cms.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleRepository extends JpaRepository<Article, Long>{
}
