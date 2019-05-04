package com.example.course.service.feign;

import com.example.common.entity.Commentary;
import com.example.common.entity.CourseChat;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @description 调用social服务接口
 */
@FeignClient(value = "${social.service}", fallback = ErrorSocialServiceCallback.class)
public interface FeignSocialService {

    @PostMapping("/commentary/")
    public Status addCommentary(@RequestBody Commentary commentary);

    @GetMapping("/commentary/{cid}/{page}/{size}")
    public Superstate getCommentaryListByCidForPageSize(@PathVariable("cid") int cid, @PathVariable("page") int page, @PathVariable("size") int size);

    @PostMapping("/course/chat/")
    public Status addCourseChat(@RequestBody CourseChat courseChat);

    @GetMapping("/course/chat/{cid}/{page}/{size}")
    public Superstate getCourseChatListByCidForPageSize(@PathVariable("cid") int cid, @PathVariable("page") int page, @PathVariable("size") int size);

}
