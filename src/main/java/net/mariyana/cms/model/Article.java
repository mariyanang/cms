package net.mariyana.cms.model;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity(name = "article")
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    private String type;

    @Basic
    private String title;

    @Basic
    private String author;

    @Basic
    private Date date;

    @Basic
    private String content;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDate() {
        String formattedDate = new SimpleDateFormat("dd MM yyyy").format(date);

        return formattedDate;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
