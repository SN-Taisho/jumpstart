package com.jumpstart.services;

import javax.servlet.http.HttpServletRequest;

public class RequestService {

	public static String getSiteURL(HttpServletRequest request) {
		
		String siteURL = request.getRequestURL().toString();
		return siteURL.replace(request.getServletPath(), "");
	}
}
