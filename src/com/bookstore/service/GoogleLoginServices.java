package com.bookstore.service;

import com.bookstore.entity.Customer;
import com.bookstore.entity.GoogleUser;
import com.google.gson.Gson;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Content;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.json.JSONObject;

import java.io.IOException;

public class GoogleLoginServices {

    public static final String GOOGLE_CLIENT_ID = "1070286133860-jksqqq9c541t700aseje19s2t12sb462.apps.googleusercontent.com";

    public static final String GOOGLE_CLIENT_SECRET = "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";

    public static final String GOOGLE_REDIRECT_URI = "http://localhost:9090/BookStoreWebsite/login";

    public static final String GOOGLE_GRANT_TYPE = "authorization_code";

    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public String getToken(String code) throws ClientProtocolException, IOException {

        Content content = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", GOOGLE_CLIENT_ID)
                                .add("client_secret", GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", GOOGLE_GRANT_TYPE)
                                .build()
                )
                .execute()
                .returnContent();

        String responseString = content.asString();
        System.out.println("Response: " + responseString);

        // Chuyển đổi phản hồi JSON sử dụng org.json
        JSONObject jsonObj = new JSONObject(responseString);

        // In toàn bộ JSON object để kiểm tra cấu trúc của nó
        System.out.println("Parsed JSON: " + jsonObj.toString());

        if (jsonObj.has("access_token")) {
            String accessToken = jsonObj.getString("access_token");
            return accessToken;
        } else {
            System.out.println("No access_token found in response.");
            return null;
        }
    }

    public static Customer getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;

        String response = Request.Get(link).execute().returnContent().asString();

        // Ánh xạ JSON từ Google vào lớp tạm thời GoogleUser
        GoogleUser googleUser = new Gson().fromJson(response, GoogleUser.class);

        // Chuyển đổi dữ liệu từ GoogleUser sang Customer
        Customer customer = convertGoogleUserToCustomer(googleUser);

        return customer;
    }

    private static Customer convertGoogleUserToCustomer(GoogleUser googleUser) {
        Customer customer = new Customer();
        customer.setEmail(googleUser.getEmail());
        customer.setFirstname(googleUser.getGiven_name());
        customer.setLastname(googleUser.getFamily_name());

        customer.setRegisterDate(new java.util.Date());
        return customer;
    }
}
