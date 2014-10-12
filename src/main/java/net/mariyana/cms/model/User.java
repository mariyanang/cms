package net.mariyana.cms.model;


import org.json.JSONObject;

import javax.persistence.*;

@Entity(name = "account")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    private String name;

    @Basic
    private String email;

    @Basic
    private String password;

    public static void main(String[] args) {
        User user = new User();
        user.setId(1L);
        user.setName("test");
        user.setEmail("rata");
        user.setPassword("badwolf");

        System.out.println(new JSONObject(user).toString());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}