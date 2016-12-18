package com.kosta136th.user;

public interface UserDAO {
<<<<<<< HEAD

	public String checkEmailDuplication(String email) throws Exception;

	public String signupEmail(User userInfo, String register_type_code) throws Exception;
	
	public String encryptPasswordSHA256(String password) throws Exception;

	public LoginInfo signinEmail(User user) throws Exception;

	public boolean signout(User user) throws Exception;
	
=======
	
	public User signinEmail(User loginEmailVO) throws Exception; //이메일로그인
	
	public boolean signupEmail(User loginEmailVO, String register_type_code) throws Exception; //이메일가입
	
	public User signinNaver(String NaverEmail) throws Exception; //네이버로그인
	
	public boolean signupNaver(User signupNaverVO) throws Exception; //네이버가입
	
	public boolean signout(User signoutVO) throws Exception; //로그아웃
	
	//유틸
	public String encryptPasswordSHA256(String password) throws Exception;	//비밀번호 암호화
	
	public String checkEmailDuplication(String email) throws Exception;		//이메일중복체크
	
	public String checkNicknameDuplication(String nickname) throws Exception; //닉네임 중복체크
	
	public boolean updateUserPassword(User userVO) throws Exception;		//비밀번호변경
>>>>>>> refs/remotes/origin/master
}
