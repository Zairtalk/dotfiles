function start_mc_sk --wraps='s docker run -it -p 25565:25565 -e EULA=TRUE -e MEMORY="2G" -v /home/zairtalk/minecraft-data-skyblock:/data itzg/minecraft-server' --description 'alias start_mc_sk=s docker run -it -p 25565:25565 -e EULA=TRUE -e MEMORY="2G" -v /home/zairtalk/minecraft-data-skyblock:/data itzg/minecraft-server'
  s docker run -it -p 25565:25565 -e EULA=TRUE -e MEMORY="2G" -v /home/zairtalk/minecraft-data-skyblock:/data itzg/minecraft-server $argv; 
end
