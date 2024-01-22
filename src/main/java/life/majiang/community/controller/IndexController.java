package life.majiang.community.controller;

import life.majiang.community.cache.HotTagCache;
import life.majiang.community.dto.PaginationDTO;
import life.majiang.community.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

/**
 * Created by codedrinker on 2019/4/24.
 */
@Controller
public class IndexController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private HotTagCache hotTagCache;

    @GetMapping("/")
    public String index(Model model,
                        @RequestParam(name = "page", defaultValue = "1") Integer page,
                        @RequestParam(name = "size", defaultValue = "10") Integer size,
                        @RequestParam(name = "search", required = false) String search,
                        @RequestParam(name = "tag", required = false) String tag,
                        @RequestParam(name = "sort", required = false) String sort) {
        PaginationDTO dto = new PaginationDTO();
        dto.setPagination(0, 1);
        model.addAttribute("pagination", dto);
        model.addAttribute("search", search);
        model.addAttribute("tag", tag);
        model.addAttribute("tags", new ArrayList<>());
        model.addAttribute("sort", sort);

        try {
            model.addAttribute("pagination", questionService.list(search, tag, sort, page, size));
            model.addAttribute("tags", hotTagCache.getHots());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "index";
    }
}
