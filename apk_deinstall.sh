#!/bin/bash
# list any packages you want to deinstall
apk=(	com.google.android.apps.docs 
	com.google.android.videos
	com.google.android.apps.tachyon
	com.facebook.katana
	com.netflix.mediaclient
	com.linkedin.android
	cn.wps.moffice_eng
	com.duokan.phone.remotecontroller.peel.plugin
	com.duokan.phone.remotecontroller
	com.alibaba.aliexpresshd
	com.amazon.mShop.android.shopping
	com.ebay.mobile
	com.ebay.carrier
	com.block.puzzle.game.hippo.mi
	com.sukhavati.gotoplaying.bubble.BubbleShooter.mint
	com.bubble.free.bubblestory
	com.crazy.juicer.xm
	com.logame.eliminateintruder3d
	com.micredit.in
	cn.wps.xiaomi.abroad.lite
	com.mi.health
	com.mi.global.shop
	com.mi.global.bbscom.google.android.googlequicksearchbox 
	com.google.android.gm
	com.google.android.apps.maps
	com.google.android.youtube
	com.google.android.apps.youtube.music
	com.google.android.apps.photos
	com.google.android.apps.wellbeing
	com.google.android.syncadapters.calendar
	com.google.android.syncadapters.contacts
	com.google.android.tts
	com.google.ar.lens
	com.google.android.contacts
	com.google.android.marvin.talkback
	com.android.stk 
	com.facebook.appmanager	
	com.facebook.system
	com.facebook.services
	com.netflix.partner.activation
	com.android.browser
	com.xiaomi.glgm
	com.xiaomi.mipicks
	com.mipay.wallet.in
	com.xiaomi.payment
	com.xiaomi.midrop
	com.xiaomi.joyose
	com.miui.weather2
	com.miui.yellowpage
	com.miui.android.fashiongallery
	com.miui.cloudservice
	com.miui.cloudbackup
	com.miui.msa.global
	com.miui.analytics
	com.miui.bugreport
	com.miui.notes
	com.miui.videoplayer
	com.miui.player
	com.miui.hybrid
	)
for m in "${apk[@]}"					            #loop through the list of packages
do	
package=$(adb shell pm path ${m}) 			  #get installation path for each package
	if [ -z $package ]				              #if no path is found
	then						                        #then
		echo "Can't find package ${m}"		    #notify
	else 						#else
		if [[ $package == *"system"* ]]		    #if package is installed in system path
		then					                        #then
		echo "Removing system $package:"
		adb shell pm uninstall --user 0 ${m}	#remove it as a system app
		else					                        #else package is installed in user path
		echo "Removing user $package:"
		adb shell pm uninstall ${m}		        #so remove it as an user app
		fi
	fi
done
