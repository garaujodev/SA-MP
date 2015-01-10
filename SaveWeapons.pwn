#include <a_samp>
#include <DOF2>

//Code to save weapons

public OnFilterScriptExit() return DOF2_Exit();

public OnPlayerDisconnect(playerid, reason)
{
    new Arma[13], Bala[13],Arma_[20],Bala_[20];
    new strName[] = GetAccount(playerid);
    if(!DOF2_FileExists(strName)) DOF2_CreateFile(strName);
    for(new i = 0; i < 13; i++)
    {
        GetPlayerWeaponData(playerid,i,Arma[i],Bala[i]);
        format(Arma_,20,"Arma%d",i);
        format(Bala_,20,"Bala%d",i);
        
        DOF2_SetInt(strName, Arma_, Arma[i]);
        DOF2_SetInt(strName, Bala_, Bala[i]);
        DOF2_SaveFile();
    }
    return 1;
}

public OnPlayerSpawn(playerid)
{
    if(DOF2_FileExists(GetAccount(playerid)))
    {
        new Arma_[20],Bala_[20];
        for(new i = 0; i > 13; i++)
        {
            format(Arma_, 20,"Arma%d",i);
            format(Bala_,20,"Bala%d",i);
            GivePlayerWeapon(playerid,DOF2_GetInt(GetAccount(playerid),Arma_),DOF2_GetInt(GetAccount(playerid),Bala_));
        }
        DOF2_RemoveFile(GetAccount(playerid));
        return 1;
    }
    return 1;
}
stock GetAccount(playerid)
{
    new str[20], name[20];
    GetPlayerName(playerid, name, 20);
    format(str, 20, "%s.wpn", name);
    return str;
}
