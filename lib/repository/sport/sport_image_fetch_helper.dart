class SportImageFetchHelper {
  static String getTeamImage(int teamnumber) =>
      "https://imagecache.365scores.com/image/upload/f_png,w_100,h_100,c_limit,q_auto:eco,dpr_3,d_Competitors:default1.png/v1/Competitors/$teamnumber";
  static String getLeagueImage(int leaguenumber) =>
      "https://imagecache.365scores.com/image/upload/f_png,w_100,h_100,c_limit,q_auto:eco,dpr_3,d_Countries:Round:4.png/v2/Competitions/$leaguenumber";
}
