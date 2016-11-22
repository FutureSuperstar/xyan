package com.xyan.frame.util;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA1Utils {
	
	private static final String ENCODE = "UTF-8";

	private static MessageDigest sha1MD;

	public static byte[] SHA1(String text) {
		if (null == sha1MD) {
			try {
				sha1MD = MessageDigest.getInstance("SHA-1");
			} catch (NoSuchAlgorithmException e) {
				return null;
			}
		}
		try {
			sha1MD.update(text.getBytes(ENCODE), 0, text.length());
		} catch (UnsupportedEncodingException e) {
			sha1MD.update(text.getBytes(), 0, text.length());
		}
		return sha1MD.digest();
	}
}