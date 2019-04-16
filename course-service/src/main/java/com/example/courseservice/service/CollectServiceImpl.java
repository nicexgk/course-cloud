package com.example.courseservice.service;

import com.example.common.entity.Collect;
import com.example.common.entity.Status;
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
    public ArrayList<Collect> getCollectListBySidForPageSize(int sid, int page, int size) {
        return collectMapper.queryCollectListBySidForStartSize(sid, page * size, size);
    }

    @Override
    public Collect getCollectBySidCid(int sid, int cid) {
        return collectMapper.queryCollectBySidCid(sid, cid);
    }
}
