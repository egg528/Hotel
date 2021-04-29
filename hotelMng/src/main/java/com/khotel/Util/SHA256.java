package com.khotel.Util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	/**
	* SHA-256으로 해싱하는 메소드
	* 
	* @param bytes
	* @return
	* @throws NoSuchAlgorithmException 
	*/
	public static byte[] sha256(String msg) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(msg.getBytes());
		
		return md.digest();
	}
	
	/**
	* 바이트를 헥사값으로 변환한다, 
	* 
	* @param bytes
	* @return
	*/
	public static String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b: bytes) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}

}
