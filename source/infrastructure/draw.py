import pandas as pd
import random

def drawlots(groupid, numluck, file_path='namelist.csv'):
    df_wholegroup = pd.read_csv(file_path)
    lst_thisweek = df_wholegroup[df_wholegroup['group'] == groupid]['name'].tolist()
    print('本周有可能参加组会报告的同学是：', lst_thisweek)
    lst_thistalk = random.sample(lst_thisweek, numluck)
    print('其中', str(numluck) , '位报告的同学是：', lst_thistalk)

if __name__=='__main__':
    group = 2 # 本周到第几组同学
    num = 2 # 随机抽取几个人
    file = 'namelist.csv'
    drawlots(groupid=group, numluck=num)