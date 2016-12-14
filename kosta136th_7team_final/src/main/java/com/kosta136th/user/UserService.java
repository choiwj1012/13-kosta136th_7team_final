package com.kosta136th.user;

public interface UserService {
	
	public User signinEmail(User loginEmailDTO) throws Exception; //이메일로 로그인
	
	public boolean signupEmail(User loginEmailDTO, String register_type_code) throws Exception; //회원가입
	
	public String checkEmailDuplication(String email) throws Exception; //중복 이메일 체크
	
	public String checkNicknameDuplication(String nickname) throws Exception;  //중복 닉네임 체크
	
	public User signinNaver(String email) throws Exception;  //네이버로 로그인
	
	public boolean signout(User signoutVO) throws Exception;  //로그아웃
	
	public boolean signupNaver(User signinNaverVO) throws Exception;  //네이버로 회원가입
	
	public boolean updateUserPassword(User userVO) throws Exception;  //유저 비밀번호 변경
	
}
