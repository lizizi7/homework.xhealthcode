package services;

import dao.CodeSummaryCollection;
import dao.CollegeDao;
import ext.exception.ServiceConstructException;

import java.util.ArrayList;


public class Cache implements ICache {
    private ICollegeRepository collegeRepository;

    public Cache(ICollegeRepository collegeRepository){
        this.collegeRepository = collegeRepository;
    }

    private CacheItem<ArrayList<CollegeDao>> collegeDaosCache = new CacheItem<ArrayList<CollegeDao>>() {
        @Override
        protected ArrayList<CollegeDao> create() {
            return collegeRepository.getColleges();
        }
    };

    private CacheItem<CodeSummaryCollection> codeSummaryCollectionCache = new CacheItem<CodeSummaryCollection>() {
        @Override
        protected CodeSummaryCollection create() {
            return collegeRepository.getSummary();
        }
    };


    @Override
    public CacheItem<CodeSummaryCollection> codeSummaryCollectionCache() {
        return this.codeSummaryCollectionCache;
    }

    @Override
    public CacheItem<ArrayList<CollegeDao>> collegeDaosCache() {
        return collegeDaosCache;
    }

    @Override
    public ArrayList<CollegeDao> collegeDaos() {
        ArrayList<CollegeDao> collegeDaos = this.collegeDaosCache.get();
        CollegeDao.combine(collegeDaos, codeSummaryCollectionCache.get());
        return collegeDaos;
    }

    /**
     * 用于强制清除缓存
     */
    public static void clearCache(){
        try {
            Cache cache = (Cache) ServiceContainer.get().cache();
            cache.collegeDaosCache.clear();
            cache.codeSummaryCollectionCache.clear();
        } catch (ServiceConstructException e) {
            e.printStackTrace();
        }
    }
}
