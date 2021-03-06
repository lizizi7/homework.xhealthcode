package services;

import ext.exception.OperationFailedException;
import ext.exception.ServiceConstructException;
import models.DailyCard;
import org.apache.xmlbeans.impl.xb.xsdschema.OpenAttrs;
import requests.UserAcquire;
import util.QRCode.QRParamsException;

import javax.servlet.http.HttpServletRequest;

public interface IHealthFeedback {
    String getMsg();

    public void test(UserAcquire userAcquire, HttpServletRequest request) throws ServiceConstructException, OperationFailedException;

    public void processingAcquire(UserAcquire userAcquire, HttpServletRequest request)
            throws ServiceConstructException, OperationFailedException;
    public void processingClock(UserAcquire userAcquire,HttpServletRequest request)
            throws ServiceConstructException, OperationFailedException;
    public void creatQRCode(HttpServletRequest request) throws ServiceConstructException, OperationFailedException, QRParamsException;

}
