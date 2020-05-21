package services;

import ext.ServiceConstructException;
import ext.ServiceContainerBase;
import ext.declare.DbContextBase;
import ext.declare.ITestService;

/**
 * 声明服务容器的实例
 */
public class ServiceContainer extends ServiceContainerBase {
    /**
     * 必须项：服务容器
     */
    @Override
    protected void injectServices() {
        addTransient(ITestService.class, TestService.class);
        addTransient(DbContextBase.class, DbContext.class);
    }

    public TestService testService() throws ServiceConstructException {
        return (TestService)getService(ITestService.class);
    }

    public DbContext dbContext() throws ServiceConstructException {
        return (DbContext)getService(DbContextBase.class);
    }

    /**
     * 获取服务容器单例
     * @return 服务容器单例
     */
    public static ServiceContainer get(){
        return ServiceContainerBase.get(ServiceContainer.class);
    }
}