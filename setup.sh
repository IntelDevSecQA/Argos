#!/bin/bash

echo '         _                   _           _              _            _        '
echo '        / /\                /\ \        /\ \           /\ \         / /\      '
echo '       / /  \              /  \ \      /  \ \         /  \ \       / /  \     '
echo '      / / /\ \            / /\ \ \    / /\ \_\       / /\ \ \     / / /\ \__  '
echo '     / / /\ \ \          / / /\ \_\  / / /\/_/      / / /\ \ \   / / /\ \___\ '
echo '    / / /  \ \ \        / / /_/ / / / / / ______   / / /  \ \_\  \ \ \ \/___/ '
echo '   / / /___/ /\ \      / / /__\/ / / / / /\_____\ / / /   / / /   \ \ \       '
echo '  / / /_____/ /\ \    / / /_____/ / / /  \/____ // / /   / / /_    \ \ \      '
echo ' / /_________/\ \ \  / / /\ \ \  / / /_____/ / // / /___/ / //_/\__/ / /      '
echo '/ / /_       __\ \_\/ / /  \ \ \/ / /______\/ // / /____\/ / \ \/___/ /       '
echo '\_\___\     /____/_/\/_/    \_\/\/___________/ \/_________/   \_____\/        '
echo '    '




echo '#######################################################################'
echo '#                         Let me update your OS                       #'
echo '#######################################################################'

sudo apt -y update && sudo apt -y upgrade
# sudo snap refresh

# Optional Virtualbox tools
# sudo add-apt-repository multiverse
# sudo apt install virtualbox-guest-dkms virtualbox-guest-x11
# sudo adduser osint vboxsf

echo '#######################################################################'
echo '#                            A few scripts                           #'
echo '#######################################################################'

#######################################################################
#If you want to download those Bazzell goodies - Please change PASSWORD with the current one!
#this is the actual procedure by M. Bazzell
#cd ~/Documents/ && curl -u osint:PASSWORD -O https://inteltechniques.com/osintbooksecure/linux.20.txt

#those are M. Bazzell Workflows
#cd ~/Downloads  && curl -u osint:PASSWORD -O https://inteltechniques.com/osintbooksecure/workflow.zip && unzip workflow.zip -d ~/Documents/

#those are M. Bazzell HTML TOOLS
#cd ~/Downloads  && curl -u osint:PASSWORD -O https://inteltechniques.com/osintbooksecure/tools.zip && unzip tools.zip -d ~/Documents/
#######################################################################

mkdir ~/Documents/scripts && cp ~/Downloads/Argos/scripts/* ~/Documents/scripts
sudo chmod +x ~/Documents/scripts/*.sh

mkdir ~/Pictures/icons && cp ~/Downloads/Argos/multimedia/icons/* ~/Pictures/icons

sudo cp ~/Downloads/Argos/shortcuts/* /usr/share/applications/

# this command will copy all the OSINT templates to the Templates Directory. I may need to delete o move to another directory all the Templates directory's default templates
cp -r ~/Downloads/Argos/templates/* ~/Templates

# moving update_osint_tools.sh in the programs directory
mkdir -p ~/Downloads/Programs && cp ~/Downloads/Argos/update_osint_tools.sh ~/Downloads/Programs/

# setting the 'quiet priest' background image
cp ~/Downloads/Argos/multimedia/wallpapers/* ~/Pictures && ~/Documents/scripts/background.sh


echo '#######################################################################'
echo '#      Requirements for installing tools, scripts and launchers       #'
echo '#######################################################################'
sudo apt install -y vlc
sudo apt install -y python3
sudo apt install -y python-setuptools
sudo apt install -y jq
sudo apt install -y python3-pip
sudo apt install -y git
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y curl
sudo apt install -y webhttrack
sudo apt install -y ffmpeg
sudo apt install -y mediainfo-gui
sudo apt install -y libimage-exiftool-perl
sudo -H pip3 install --upgrade youtube_dl
sudo -H pip3 install Instalooter
sudo -H pip3 install Instaloader
sudo python3 -m pip install pipenv

echo '#######################################################################'
echo '#                             Amass                                   #'
echo '#######################################################################'
sudo snap install amass

echo '#######################################################################'
echo '#                             Twint                                   #'
echo '#######################################################################'
cd 
git clone https://github.com/twintproject/twint.git ~/Downloads/Programs/twint
cd twint
sudo -H pip3 install ~/Downloads/Programs/twint/twint
sudo -H pip3 install -r ~/Downloads/Programs/twint/requirements.txt

echo '#######################################################################'
echo '#                          EyeWitness                                 #'
echo '#######################################################################'

git clone https://github.com/ChrisTruncer/EyeWitness.git ~/Downloads/Programs/EyeWitness
cd EyeWitness/Python/setup
sudo -H ./setup.sh
cd ~/Documents/scripts
sed -i "s/Programs\/EyeWitness/Programs\/EyeWitness\/Python/g" eyewitness.sh

echo '#######################################################################'
echo '#                           sublist3r                                 #'
echo '#######################################################################'
cd 
git clone https://github.com/aboul3la/Sublist3r.git ~/Downloads/Programs/Sublist3r
cd Sublist3r && sudo -H pip3 install -r requirements.txt

echo '#######################################################################'
echo '#                              Photon                                 #'
echo '#######################################################################'

git clone https://github.com/s0md3v/Photon.git ~/Downloads/Programs/Photon
cd Photon && sudo -H pip3 install -r requirements.txt

echo '#######################################################################'
echo '#                       The Harvester                                 #'
echo '#######################################################################'

git clone https://github.com/laramies/theHarvester.git ~/Downloads/Programs/theHarvester
cd theHarvester
git checkout 8b88a66
sudo -H pip3 install -r requirements.txt

echo '#######################################################################'
echo '#                           Metagoofil                                #'
echo '#######################################################################'

git clone https://github.com/opsdisk/metagoofil.git ~/Downloads/Programs/metagoofil
cd metagoofil
sudo -H pip3 install -r requirements.txt

echo '#######################################################################'
echo '#                              recon-ng                               #'
echo '#######################################################################'

git clone https://github.com/lanmaster53/recon-ng.git ~/Downloads/Programs/recon-ng
cd recon-ng
sudo -H pip3 install -r REQUIREMENTS

echo '#######################################################################'
echo '#                              sherlock                               #'
echo '#######################################################################'

git clone https://github.com/sherlock-project/sherlock.git ~/Downloads/Programs/sherlock
cd sherlock
python3 -m pip install -r requirements.txt
cd ~/Documents/scripts/
sed -i 's/Programs\/sherlock/Programs\/sherlock\/sherlock/g' sherlock.sh

echo '#######################################################################'
echo '#                            spiderfoot                               #'
echo '#######################################################################'

git clone https://github.com/smicallef/spiderfoot.git ~/Downloads/Programs/spiderfoot
cd spiderfoot
sudo -H pip3 install -r requirements.txt
cd ~/Documents/scripts
sed -i '/^sudo/ d' spiderfoot.sh
sed -i '/^firefox/ d' spiderfoot.sh
echo "cd ~/Downloads/Programs/spiderfoot" >> spiderfoot.sh
echo "python3 sf.py -l 127.0.0.1:5001 &" >> spiderfoot.sh
echo "sleep 5" >> spiderfoot.sh
echo "firefox http://127.0.0.1:5001" >> spiderfoot.sh

echo '#######################################################################'
echo '#                     Elasticsearch-Crawler                           #'
echo '#######################################################################'

git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git ~/Downloads/Programs/Elasticsearch-Crawler
cd Elasticsearch-Crawler
sudo -H pip3 install nested-lookup
sudo -H pip3 install internetarchive

echo '#######################################################################'
echo '#                               Ripgrep                               #'
echo '#######################################################################'
cd ~/Downloads/
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

echo '#######################################################################'
echo '#                                holehe                               #'
echo '#######################################################################'

git clone https://github.com/megadose/holehe.git ~/Downloads/Programs/holehe
cd holehe
sudo python3 setup.py install

echo '#######################################################################'
echo '#                              anonsurf                               #'
echo '#######################################################################'

git clone https://github.com/Und3rf10w/kali-anonsurf.git ~/Downloads/Programs/kali-anonsurf
cd kali-anonsurf/
sudo ./installer.sh

echo '#######################################################################'
echo '#                        Moriarty-Project                             #'
echo '#######################################################################'

git clone https://github.com/AzizKpln/Moriarty-Project ~/Downloads/Programs/Moriarty-Project
cd Moriarty-Project
chmod 755 install.sh ./install.sh

echo '#######################################################################'
echo '#                               maigret                               #'
echo '#######################################################################'

git clone https://github.com/soxoj/maigret ~/Downloads/Programs/maigret
pip3 install ~/Downloads/Programs/maigret/.

echo '#######################################################################'
echo '#                           Google Earth                              #'
echo '#######################################################################'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo wget -O google-earth64.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo dpkg -i google-earth64.deb && sudo apt -f install && sudo rm google-earth64.deb

echo '#######################################################################'
echo '#                               Maltego                               #'
echo '#######################################################################'
sudo wget -O maltego.deb https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.2.14.13579.deb
sudo dpkg -i maltego.deb && sudo apt -f install && sudo rm maltego.deb

echo '#######################################################################'
echo '#                       Customising scripts                           #'
echo '#######################################################################'
cd ~/Documents/scripts/
sed -i "s/python3\.6/python3/g" domains.sh
sed -i "s/python\ sublist3r/python3\ sublist3r/g" domains.sh
sed -i "s/pip\ install/pip3\ install/g" updates.sh
sed -i "s/sudo\ pip3/sudo\ \-H\ pip3/g" updates.sh
pip3 install --upgrade pip
cd ~/Downloads/Programs

echo '#######################################################################'
echo '#                       General Purpose tools                         #'
echo '#######################################################################'
sudo add-apt-repository -y ppa:giuspen/ppa && sudo apt install -y cherrytree
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add - && sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list' && sudo apt update && sudo apt install -y atom
sudo apt install -y keepassxc
sudo apt install -y kazam
sudo apt install -y audacity
sudo apt install -y openjdk-11-jre
sudo apt install -y ripgrep
sudo apt install -y ubuntu-restricted-extras p7zip unrar
git clone https://github.com/pstirparo/threatintel-resources ~/Documents/threatintel-resources
sudo apt autoremove
