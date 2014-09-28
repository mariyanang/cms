package net.mariyana.cms.repo;

import net.mariyana.cms.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
