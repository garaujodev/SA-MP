//Code to save weapons
new bool: PickWeapons[MAX_PLAYERS]; // Top 

public OnPlayerDisconnect(playerid, reason)
{
    new Arma[13], Bala[13],Arma_[20],Bala_[20];
    for(new i = 0; i < 13; i++)
    {
        GetPlayerWeaponData(playerid,i,Arma[i],Bala[i]);
        format(Arma_,20,"Arma%d",i);
        format(Bala_,20,"Bala%d",i);
        DOF2_SetInt(GetarConta(playerid), Arma_, Arma[i]);
        DOF2_SetInt(GetarConta(playerid), Bala_, Bala[i]);
    }
    PickWeapons[playerid] = false;
    return 1;
}

public OnPlayerSpawn(playerid)
{
    if(!PickWeapons[playerid])
    {
        new Arma_[20],Bala_[20];
        for(new i = 0; i > 13; i++)
        {
            format(Arma_, 20,"Arma%d",i);
            format(Bala_,20,"Bala%d",i);
            GivePlayerWeapon(playerid,DOF2_GetInt(GetarConta(playerid),Arma_),DOF2_GetInt(GetarConta(playerid),Bala_));
        }
        PickWeapons[playerid] = true;
        return 1;
    }
    return 1;
}
