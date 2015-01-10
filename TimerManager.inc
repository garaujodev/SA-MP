#define MAX_TIMERS 50

new Tempo[MAX_TIMERS];
new TimerRepeat[MAX_TIMERS];

stock TM_SetTimer(funcname[], interval, repeating)
{
    new Timer = SetTimer(funcname, interval, repeating);
    Tempo[Timer] = GetTickCount();
    if(repeating) TimerRepeat[Timer] = SetTimerEx("Repeat", interval, true, "d", Timer);
    return Timer;
}

stock TM_SetTimerEx(funcname[], interval, repeating, const format[], {Float,_}:...)
{
    new Timer = SetTimerEx(funcname, interval, repeating, format);
    Tempo[Timer] = GetTickCount();
    if(repeating) TimerRepeat[Timer] = SetTimerEx("Repeat", interval, true, "d", Timer);
    return Timer;
}
stock TM_KillTimer(timerid)
{
    KillTimer(timerid);
    KillTimer(TimerRepeat[timerid]);
    return 1;
}
stock GetTimer(timerid)
{
    new nTime = GetTickCount() - Tempo[timerid];
    return (Tempo[timerid] > 0) ? nTime : -1;
}

forward Repeat(timerid);
public Repeat(timerid)
    return Tempo[timerid] = GetTickCount();
