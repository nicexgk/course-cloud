package com.example.courseservice.service;

import com.example.common.entity.Collect;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;

import java.util.ArrayList;

public interface CollectService {

    public Status addCollect(int sid, int cid);

    public Status deleteCollect(int sid, int cid);

    public Superstate getCollectListBySidForPageSize(int sid, int page, int size);

    public Collect getCollectBySidCid(int sid, int cid);
}
