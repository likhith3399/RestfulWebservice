package com.common.controller;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/users")
public class UserController {

	public static List<UserInfo> users = new ArrayList<UserInfo>();
	
	@RequestMapping(value="/registereduser", method = RequestMethod.GET)
	public String getUsers( ModelMap model) throws JSONException {
		JSONArray list = new JSONArray();
		for(UserInfo info : users){
			JSONObject json = new JSONObject();
			json.put("userId", info.getUserId());
			json.put("emailId", info.getEmailId());
			json.put("date", info.getEmailId());
			list.put(json);
		}
		model.addAttribute("value", list.toString());
		return "list";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public String addUser( @RequestBody String body, ModelMap model ) throws JSONException {
		JSONObject json = new JSONObject(body);
		UserInfo info = new UserInfo(json.optString("userId", null), json.optString("emailId", null), json.optString("date", null));
		users.add(info);
		System.err.println("Json Body:"+json.toString());
		model.addAttribute("value", "Added successfully");
		return "list";
	}

	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String deleteUser( @RequestBody String body, ModelMap model ) throws JSONException {
		JSONObject json = new JSONObject(body);
		UserInfo info = new UserInfo(json.optString("userId", null), json.optString("emailId", null), json.optString("date", null));
		if(users.contains(info))
		{
			users.remove(info);
		}
		System.err.println("Json Body:"+json.toString());
		model.addAttribute("value", "Deleted successfully");
		return "list";
	}
}