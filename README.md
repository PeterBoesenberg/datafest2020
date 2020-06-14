# datafest2020
Examing the war in Ukraine 2018-2020 as part of the DataFest Tbilisi 2020 Datathon
The challenge was to visualize data from one of two possible datasets. I chose to use data from the "armed conflict location & event data project" (https://acleddata.com/). I'm interested in the Ukraine, so I took the datefiles about Eastern & Southeastern Europe & the Balkans (https://acleddata.com/download/14515/)

# data preparation
I read the data file and filtered it for all data in the Ukraine. I checked for missing values and inconsistencies, but since the data files were curated, no additional cleaning was needed.

# visualization
My first theory was, that the conflicts are located in the eastern part of the Ukraine. To check this assumption, I created a map of the Ukraine with highlights every city with the number of armed conflicts between 2018 and May 2020. I indicated the number with the size & color of circles. It clearly showed, that armed conflict are mainly in the eastern part of the Ukraine, but not restricted to it. In fact, there are additional hotspots all over the country. 

This led me to check the data some more. There are several types of "armed conflicts":
Battles: 18160
Explosions/Remote Violence: 15083
Protests: 14577
Riots: 1112
Strategic developments: 1380
Violence against civilians: 700

Although all of them are bad and sad, I was interested mainly in whether the war in eastern Ukraine is still going on. Therefore I filtered only for battles and visualized the numbers per city again on a map. It showed, thatt apart from single battles, they are happing in big numbers in the eastern Ukraine. The war ist still active.

My next question was, who is participating in all those armed conflicts. Is it split across several groups of participants or are there some main actors? I counted them and showed it on a bar chart. With over 26000 conflicts, the NAF (United Armed Forces of Novorossiya) were leading the chart, followed by the Military Forces of Ukraine, with over 20000 conflicts from 2014-2019 and nearly 9000 conflicts from 2019 up to 2020. The fights are mainly going on between those two.

Since here in Germany I haven't heard a lot about the war in Ukraine for a long time, I thought maybe it is ending and the number of battles is decreasing. To check this, I created a time chart, where I aggregated the number of battles for each month from 2018 upto May 2020. There were spikes, but in the end, the number of battles was in April 2018 with 465 on the same level like in February 2018 with 488 battles. Its safe to say, that no, the war is not coming to an end.