package com.example.courseservice.service;


import com.example.common.entity.Catalog;

import java.util.ArrayList;
import java.util.List;

public interface CatalogService {

    public boolean addCatalog(Catalog catalog);

    public boolean addCatalogList(List<Catalog> catalogList);

    public ArrayList<Catalog> getCatalogList(int id);

    public boolean deleteCatalogByCourseId(int id);

}
