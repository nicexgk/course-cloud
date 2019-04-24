package com.example.courseservice.controller;

import com.example.common.entity.Collect;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.courseservice.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/collection")
public class CollectController {

    @Autowired
    private CollectService collectService;

    @PostMapping("/{sid}/{cid}")
    public Status addCollect(@PathVariable("sid")int sid, @PathVariable("cid")int cid){
        return collectService.addCollect(sid, cid);
    }

    @DeleteMapping("/{sid}/{cid}")
    public Status deleteCollect(@PathVariable("sid")int sid, @PathVariable("cid")int cid){
        return collectService.deleteCollect(sid, cid);
    }

    @GetMapping("/{sid}/{page}/{size}")
    public Superstate getCollectListBySidForPageSize(@PathVariable("sid") int sid, @PathVariable("page")int page, @PathVariable("size") int size){
        return collectService.getCollectListBySidForPageSize(sid, page, size);
    }

    @GetMapping("/{sid}/{cid}")
    public Collect getCollectBySidCid(@PathVariable("sid") int sid, @PathVariable("cid") int cid){
        return collectService.getCollectBySidCid(sid, cid);
    }
}
