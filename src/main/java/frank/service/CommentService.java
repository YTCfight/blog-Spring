package frank.service;

import frank.mapper.CommentMapper;
import frank.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    public List<Comment> queryComments(Long id) {
        return commentMapper.queryComments(id);
    }

    public int insert(Comment comment) {
        return commentMapper.insert(comment);
    }

    public int delete(String content) {
        return commentMapper.deleteByPrimaryKey(content);
    }
}
