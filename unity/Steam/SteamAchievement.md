# Steam achievement


## TLDR
1. Import "steam work.NET" to unity project.
2. update "${PROJECT_HOME}/steam_appid.txt"  to the id buy from steam.
3. input in terminal (replace appid_t.invaid to the id buy from steam).
    ```sh
    sed -e "s/AppId_t\.Invalid/(AppId_t)${ID_FROM_STEAM}/' ${PROJECT_HOME}/Assets/Scripts/Steamwork.NET/SteamManager.cs 
    ```
4. add code at some will get achievement place.
    ```C#
    SteamUserStats.SetAchievement("API名稱");
    SteamUserStats.StoreStats();
    ```
4. add code if want clean achievement.
    ```C#
    SteamUserStats.ResetAllStats(true);
    SteamUserStats.StoreStats();
    ```
5. if want get achievement status.
    ```C#
    bool geted ;
    SteamUserStats.GetAchievement("API名稱",out geted);
    ```

## Very thanks
* [斯穆絲酷兒的巴哈文章](https://home.gamer.com.tw/creationDetail.php?sn=4156394)
* [steam work.NET](https://github.com/rlabrecque/Steamworks.NET/releases)