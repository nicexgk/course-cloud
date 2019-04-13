package com.example.courseservice.service;

import com.example.common.entity.Catalog;
import com.example.courseservice.dao.CatalogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CatalogServiceImpl implements CatalogService {
    @Resource
    private CatalogMapper catalogMapper;

    @Override
    public boolean addCatalog(Catalog catalog) {

        boolean flag = catalogMapper.addCatalog(catalog);
        if (catalog.getChildList() != null & flag){
            for(Catalog child : catalog.getChildList()){
                child.setParentId(catalog.getCatalogId());
                flag = catalogMapper.addCatalog(child);
            }
        }
        return flag;
    }

    @Override
    public boolean addCatalogList(List<Catalog> catalogList) {

        boolean flag = false;
        for(Catalog catalog : catalogList){
            flag = addCatalog(catalog);
        }
        return flag;
    }

    @Override
    public ArrayList<Catalog> getCatalogList(int id){

        ArrayList<Catalog> catalogList = catalogMapper.queryCatalogListByCourseId(id);

        for(int i = 0; i < catalogList.size() ;i ++){
            if(catalogList.get(i).getParentId() != null){
                continue;
            }
            Catalog catalog = catalogList.get(i);
//            System.out.println(catalog);
            catalog.setChildList(new ArrayList<Catalog>());

            for(int j = 0; j < catalogList.size(); j ++){
                System.out.println(catalogList.get(j).getParentId());
                if(catalogList.get(j).getParentId() != null && catalogList.get(j).getParentId().intValue() == catalog.getCatalogId()){
                    catalog.getChildList().add(catalogList.get(j));
                }
            }
            System.out.println(catalog);
        }
        for(int i = 0; i < catalogList.size() ;i ++){
            if(catalogList.get(i).getParentId() != null){
                catalogList.remove(i);
                i --;
            }
        }
        return catalogList;
    }

    public void sortCatalogList(ArrayList<Catalog> catalogList){
        for(int i = 0; i < catalogList.size(); i ++){
            for(int j = i + 1 ; j < catalogList.size(); j ++){
                if(catalogList.get(i).getCatalogOrder() > catalogList.get(i + 1).getCatalogOrder()){
                    Catalog catalog = catalogList.get(i);
                    catalogList.add(i, catalogList.get(j));
                    catalogList.add(j, catalog);
                }
            }
        }
    }

    @Override
    public boolean deleteCatalogByCourseId(int id) {
        return catalogMapper.deleteCatalogByCourseId(id);
    }
}
