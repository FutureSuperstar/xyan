package com.xyan.frame.lang;

import java.io.File;

import org.apache.commons.io.FilenameUtils;

/**
 * 文件夹工具
 * 
 * 作者: zhoubang 日期：2015年3月26日 下午1:34:04
 */
public class FolderUtils {

    /**
     * 创建完整路径
     *
     * @param path
     *            a {@link java.lang.String} object.
     */
    public static final void mkdirs(final String... path) {
        for (String foo : path) {
            final String realPath = FilenameUtils.normalizeNoEndSeparator(foo, true);
            final File folder = new File(realPath);
            if (!folder.exists() || folder.isFile()) {
                folder.mkdirs();
            }
        }
    }

}
