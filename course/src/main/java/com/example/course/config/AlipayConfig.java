package com.example.course.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092100562517";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDLhp8ErfmR91oa\n" +
            "H1ctZJ4Kj/uLZwWC+/9NKSBx3mog8xFeKKN23HZlPXx03GUuwy20qgwEEVUwPeCF\n" +
            "ccSoN2VzwaVUhQXPin3NKns8RxPHsfqyCMfvkrFEoC0LsgD2yxlqKk2OIpi/yObD\n" +
            "YZVyv8VL9N0lRU62oAf2BzX84Jh4Yn9qInaGwhX/IAhnP0DG9WNryttdZ/99xBZe\n" +
            "YwbSeCiSZqBxUWuKGMr8A1WLheKKxMrbpJeqHWCAhyOHga5lySqhyzSkHDUuY0A2\n" +
            "a03uCFBooQvhJQk958qlbbme4+D/G5affdQYh8a/EffFNQ2uDb1xLLyf47mY+Kje\n" +
            "2IZv7etTAgMBAAECggEAVAz3dN5IN/C3xBv3S6bG4cPOdSaJjyt0pq/6VywsFglr\n" +
            "vb/4qein+G1pDXXLT4GJSZgEOFXUIYUcSN/QAExIWIK7PWlmGeyuwWDu3djYoVqu\n" +
            "FoIr15N0I8wmbjMH1OPRThfESZOeE23rZvrQ1j++Qf0QqwixVhhG0WLu98zlCqmd\n" +
            "9OQY6oA+D8npJuK8KcZWs9MF/Qja24nEnoFilXaOvKAC8RxXRnLiaHd4lPGtDk8p\n" +
            "awHRYMTwtSpuSiCCJLKTknOaqvaJHYABsSFvlVq+ydUMhSOqHa8b3Dc6JZwIVSs6\n" +
            "e6w5ulbd5VNR1iumQ7vTV6k0PSXKrBzV/fwXQzooaQKBgQDxN+XEn5Dx1Vtyz/9+\n" +
            "GvDq7khTssRSWoK1AxYlHBXqcPIneIu6koO3LziKqC//Lyfbl5t/hzUIbxXFibic\n" +
            "M3N/0THW5Ar9YYvW4cC38kHJ0QOBnzpWQmHoGJq/gS0qXaQGy/kVCasKt83TrQhK\n" +
            "CV4VUClpk+jA/aQ/h7g17UzLLQKBgQDX/2ykmTZ9VIMXwQnpWm5sMUGgRKNbEfpV\n" +
            "naTH2CP7y4ZkNXAO0/C+OUQLFJM6VLJXn0M24/nM32yCsgEQaC+LzKmf5iyqmaZW\n" +
            "fNiCt9SZVX23ttpj0bt2ofHRhVULFe1E8Uwc/Lb99CrAlYuj8/fdI/MQ2fZgOlNq\n" +
            "1iV+2t2gfwKBgGKkKSGu3ucGCM96n1BCVCK+LnWLtRy4RpsfF/807QFiDqR1dy5k\n" +
            "m9hdRxHslTQVZIc4CC6ua9F3G8AcAZJet+yc73Sg7J2RNk45I0YVmzGcd4KaSpDb\n" +
            "tI3lAeMuP/oDMQBWiRVBTuCjKVhWef1Mt1yf20+BXL0O/Au+xGXJFI5BAoGBAM3h\n" +
            "Lan6S8DMRCPpIMxnIOdJT9c2dUpB6Y2ftEe0EiBXzyJG+Sd5BngaV2wEUY0A2/i+\n" +
            "2i9Av4Jy15f/mRoNZHxpOKkrmRmHWNAJMcnu9NqubSUmSiVo7LlYBQmDgBsP7FeR\n" +
            "c84RZ07KY9Gq+S3uRixnrrA6QSdZkNc9hQHUFfl7AoGBAOAsmn5w2047xs8H9aNf\n" +
            "ogoVq7JZawLQcf/f/7hFZPyq94L1YM5YKqywbeD94s6asd19gDYuphpe6g2G0jOY\n" +
            "/PmuUuRKWwS0U9az+l1ZYyhK00x4B9MJvf2qre4kl6r1V+zPpTK3wjM0a65vuvpy\n" +
            "QHDCjk/SB2x4JgKL00ollDYU";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA59r4HpstAlAop2cFnnDaoNexWAQfv/PdGo/jLqjeMfB2gC0Fj0XonNXpfIwSUSN8dyTWuEybbWTbn7dvC0PVtmORV5HdGPFvghrbSXkSMj30r6zZNgwrL8gp205BChFNnjNb9McqMdQUMG5cUU0r6Cw/TFDgMGP5DGw5qSasqpsISozmb6zjj0vXAh2z55XwI0wOgdMh2X4Vs8qd0i7m8rdUQ6QWuDSU2unprocuZxBdrjW1VMrxpFjOu67/AhwYrtEvqSZHUf2K5jcBfqqmUosAXBU33BucUlq+VlGIlH5G0orlEOdOV1UFp+usqm2eG9IE/j1Q360W2k0+I5e71wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
     public static String notify_url = "http://192.168.1.2:8080/alipay/trade/return/";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://192.168.1.2:8080/alipay/trade/notify/";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 日志路径
    public static String log_path = "C:\\";

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

