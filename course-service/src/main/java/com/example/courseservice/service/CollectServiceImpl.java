package com.example.courseservice.service;

import com.example.common.entity.Collect;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.courseservice.dao.CollectMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class CollectServiceImpl implements CollectService{

    @Resource
    private CollectMapper collectMapper;

    @Override
    public Status addCollect(int sid, int cid) {
        Status status = new Status();
        if(!collectMapper.insertCollect(sid, cid)){
            status.setStatus(400);
            status.setDescription("添加收藏失败。。。");
        }
        status.setStatus(200);
        status.setDescription("添加收藏成功！");
        return status;
    }

    @Override
    public Status deleteCollect(int sid, int cid) {
        Status status = new Status();
        if(!collectMapper.deleteCollect(sid, cid)){
            status.setStatus(400);
            status.setDescription("取消收藏失败，请重试");
        }
        status.setStatus(200);
        status.setDescription("您已取消收藏");
        return status;
    }

    @Override
    public Superstate getCollectListBySidForPageSize(int sid, int page, int size) {
        Superstate superstate = new Superstate();
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        ArrayList<Collect> collectList = collectMapper.queryCollectListBySidForStartSize(sid, page * size, size);
        superstate.setResource(collectList);
        superstate.setPage(page);
        superstate.setSize(size);
        superstate.setCount(collectMapper.queryCollectCount(sid));
        return superstate;
    }

    @Override
    public Collect getCollectBySidCid(int sid, int cid) {
        return collectMapper.queryCollectBySidCid(sid, cid);
    }
}
