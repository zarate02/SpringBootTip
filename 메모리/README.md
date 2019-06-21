GC체크 : jstat -gcutil 109432 1s

1. Serial GC : -XX:+UseSerialGC	 
2. Parallel GC : -XX:+UseParallelGC -XX:ParallelGCThreads=value	 
3. Parallel Compacting GC : -XX:+UseParallelOldGC	 
4. CMS GC	: -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:CMSInitiatingOccupancyFraction=value -XX:+UseCMSInitiatingOccupancyOnly	 
5. G1	-XX:+UnlockExperimentalVMOptions -XX:+UseG1GC	(JDK 6에서는 두 옵션을 반드시 같이 사용해야 함)
