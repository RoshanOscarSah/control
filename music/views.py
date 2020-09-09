from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
# for login
from django.contrib.auth.models import User,auth
# for logout
from django.contrib.auth import logout
# for messages
from django.contrib import messages
# for mailsend
from django.core.mail import send_mail
from django.conf import settings
# for random
import random
# for importing models
from music.models import profiles, metadata, recovery_keys, albums, artist, artist_search, library, recent , playlist, favourite
# for extraction of metadata. In terminal hit this command
# pip install tinytag
from tinytag import TinyTag
# for file save
from django.core.files.storage import FileSystemStorage
# for resizing images
from PIL import Image, ImageOps
# for removing spaces in string
import string
# web scraping
import requests
# from bs4 import BeautifulSoup
# from requests.compat import quote_plus
# from . import models
# saving file using link
import tempfile
from django.core import files
# pip install spotipy
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import sys
from pprint import pprint
# for sensing json format
import json





# Create your views here.
def index(request):
    newandtrending = albums.objects.order_by('-year')
    youmightalsolike = metadata.objects.order_by('genre')
    bestofartists = artist.objects.order_by('-total_played')
# for sending album data
    totalnewandtrending= albums.objects.order_by('-year').count()
    counter = 0
    albumsongsname = dict()
    for i in range(totalnewandtrending):
        counter = counter+1
        data1 = albums.objects.order_by('-year')[i:counter].get()
        albumdata = metadata.objects.filter(album=data1)
        albumdataa = albumdata.values()
        songcount =albumdata.count()
        albumdatasub = dict()
        for j in range(songcount):
            albumdatasub[j] = [albumdataa[j]['title'],albumdataa[j]['file'],albumdataa[j]['contributing_artists'],albumdataa[j]['artwork_name'],albumdataa[j]['length']]
        albumsongsname[i] = albumdatasub

    popularplaylists = playlist.objects.order_by('-total_played').values('playlist_name','total_played').distinct()
    popularplaylistsCounter = popularplaylists.count()
    playlist_count_dict =dict()
    for i in range(popularplaylistsCounter):
        tempPlaylistName = popularplaylists[i]['playlist_name']
        total_song = playlist.objects.filter(playlist_name=tempPlaylistName).count()

        art = playlist.objects.filter(playlist_name=tempPlaylistName).values('metadata_id')
        artCounter = art.count()
        photo_dict = dict()
        for j in range(artCounter):
            tempArtFile = art[j]['metadata_id']
            artwork_name = metadata.objects.get(id=tempArtFile).artwork_name
            photo_dict[j] = artwork_name
        playlist_count_dict[i] = photo_dict

    # data1 = artist.objects.order_by('-id')[:1].get()
    # albumdata = albums.objects.filter(album_artist= data1).count()  # kept just for example
    return render(request, 'index.html', {'newandtrending': newandtrending, 'youmightalsolike': youmightalsolike,
                                         'bestofartists': bestofartists, 'albumsongsname':albumsongsname,'popularplaylists':popularplaylists,
                                          'playlist_count_dict':playlist_count_dict})

def show_home(request):
    newandtrending = albums.objects.order_by('-year')
    youmightalsolike = metadata.objects.order_by('genre')
    bestofartists = artist.objects.order_by('-total_played')
    # for sending album data
    totalnewandtrending = albums.objects.order_by('-year').count()
    counter = 0
    albumsongsname = dict()
    for i in range(totalnewandtrending):
        counter = counter + 1
        data1 = albums.objects.order_by('-year')[i:counter].get()
        albumdata = metadata.objects.filter(album=data1)
        albumdataa = albumdata.values()
        songcount = albumdata.count()
        albumdatasub = dict()
        for j in range(songcount):
            albumdatasub[j] = [albumdataa[j]['title'], albumdataa[j]['file'], albumdataa[j]['contributing_artists'],
                               albumdataa[j]['artwork_name'], albumdataa[j]['length']]
        albumsongsname[i] = albumdatasub

    popularplaylists = playlist.objects.order_by('-total_played').values('playlist_name', 'total_played').distinct()
    popularplaylistsCounter = popularplaylists.count()
    playlist_count_dict = dict()
    for i in range(popularplaylistsCounter):
        tempPlaylistName = popularplaylists[i]['playlist_name']
        total_song = playlist.objects.filter(playlist_name=tempPlaylistName).count()

        art = playlist.objects.filter(playlist_name=tempPlaylistName).values('metadata_id')
        artCounter = art.count()
        photo_dict = dict()
        for j in range(artCounter):
            tempArtFile = art[j]['metadata_id']
            artwork_name = metadata.objects.get(id=tempArtFile).artwork_name
            photo_dict[j] = artwork_name
        playlist_count_dict[i] = photo_dict

    return render(request, 'home.html', {'newandtrending': newandtrending, 'youmightalsolike': youmightalsolike,
                                          'bestofartists': bestofartists,'albumsongsname':albumsongsname,'popularplaylists':popularplaylists,
                                          'playlist_count_dict':playlist_count_dict})

def show_top(request):
    topsong = metadata.objects.order_by('-total_played')
    topalbum = albums.objects.order_by('-total_played')
    # for albumsong play
    totaltopalbum = albums.objects.order_by('-total_played').count()
    counter = 0
    albumsongsname = dict()
    for i in range(totaltopalbum):
        counter = counter + 1
        data1 = albums.objects.order_by('-total_played')[i:counter].get()
        albumdata = metadata.objects.filter(album=data1)
        albumdataa = albumdata.values()
        songcount = albumdata.count()
        albumdatasub = dict()
        for j in range(songcount):
            albumdatasub[j] = [albumdataa[j]['title'], albumdataa[j]['file'], albumdataa[j]['contributing_artists'],
                               albumdataa[j]['artwork_name'], albumdataa[j]['length']]
        albumsongsname[i] = albumdatasub


    return render(request, 'top.html', {'topsong':topsong,'topalbum':topalbum,'albumsongsname':albumsongsname})

def show_new(request):
    newandtrending = albums.objects.order_by('-year')
    newalbumsandsingles = albums.objects.order_by('date_modified')

    # for albumsong play
    totalnewandtrending = albums.objects.order_by('-year').count()
    counter = 0
    albumsongsname = dict()
    for i in range(totalnewandtrending):
        counter = counter + 1
        data1 = albums.objects.order_by('-year')[i:counter].get()
        albumdata = metadata.objects.filter(album=data1)
        albumdataa = albumdata.values()
        songcount = albumdata.count()
        albumdatasub = dict()
        for j in range(songcount):
            albumdatasub[j] = [albumdataa[j]['title'], albumdataa[j]['file'], albumdataa[j]['contributing_artists'],
                               albumdataa[j]['artwork_name'], albumdataa[j]['length']]

        albumsongsname[i] = albumdatasub

    totalnewalbumsandsingles = albums.objects.order_by('date_modified').count()
    counter1 = 0
    albumsongsname1 = dict()
    for i in range(totalnewalbumsandsingles):
        counter1 = counter1 + 1
        data2 = albums.objects.order_by('date_modified')[i:counter1].get()
        albumdata1 = metadata.objects.filter(album=data2)
        albumdataa1 = albumdata1.values()
        songcount1 = albumdata1.count()
        albumdatasub1 = dict()
        for j in range(songcount1):
            albumdatasub1[j] = [albumdataa1[j]['title'], albumdataa1[j]['file'], albumdataa1[j]['contributing_artists'],
                               albumdataa1[j]['artwork_name'], albumdataa1[j]['length']]
        # print(albumdatasub)
        albumsongsname1[i] = albumdatasub1
    print(albumsongsname)
    return render(request, 'new.html',{'newandtrending': newandtrending, 'newalbumsandsingles':newalbumsandsingles,
                                       'albumsongsname':albumsongsname, 'albumsongsname1':albumsongsname1})

def show_recent(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        recentdata = recent.objects.filter(profiles_id=user_id.id).order_by('-id')
        # for albumsong play
        counter = 0
        albumsongsname = dict()
        for i in range(12):
            counter = counter + 1
            data1 = recent.objects.filter(profiles_id=user_id.id).order_by('-id').values('albums_id')[i:counter].get()
            # print(data1)
            albumdataname = albums.objects.filter(id=data1['albums_id']).values('album')[0]['album']
            # print(albumdataname)
            albumdata = metadata.objects.filter(album=albumdataname)
            albumdataa = albumdata.values()
            # print(albumdata)
            # print(albumdataname)
            songcount = albumdata.count()
            albumdatasub = dict()
            for j in range(songcount):
                albumdatasub[j] = [albumdataa[j]['title'], albumdataa[j]['file'], albumdataa[j]['contributing_artists'],
                                   albumdataa[j]['artwork_name'], albumdataa[j]['length']]
            # print(albumdatasub)
            albumsongsname[i] = albumdatasub
        # print(albumsongsname)
        return render(request, 'recent.html', {'data':zip(recentdata,albumsongsname), 'recentdata':recentdata, 'albumsongsname':albumsongsname})
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype': notitype})

def show_library(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        mysongs = library.objects.filter(profiles_id=user_id.id)
        return render(request, 'library.html', {'mysongs':mysongs})
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype': notitype})

def show_queue(request):
    return render(request, 'queue.html')

def show_songs(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        mysongs = library.objects.filter(profiles_id=user_id.id)
        return render(request, 'librarysongs.html', {'mysongs': mysongs})

def show_artists(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        mysongs = library.objects.filter(profiles_id=user_id.id)
    return render(request, 'libraryartists.html', {'mysongs': mysongs, })

def show_albums(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        mysongs = library.objects.filter(profiles_id=user_id.id)

        # for albumsong play
        totalalbum = mysongs.count()
        counter = 0
        albumsongsname = dict()
        for i in range(totalalbum):
            counter = counter + 1
            dat = library.objects.filter(profiles_id=user_id.id).values('albums_id')[i:counter].get()
            data1 = albums.objects.filter(id=dat['albums_id']).values('album')[0]['album']
            albumdata = metadata.objects.filter(album=data1)
            albumdataa = albumdata.values()
            songcount = albumdata.count()
            albumdatasub = dict()
            for j in range(songcount):
                albumdatasub[j] = [albumdataa[j]['title'], albumdataa[j]['file'], albumdataa[j]['contributing_artists'],
                                   albumdataa[j]['artwork_name'], albumdataa[j]['length']]
            albumsongsname[i] = albumdatasub

        print(mysongs)
        print(albumsongsname)
    return render(request, 'libraryalbums.html', {'data':zip(mysongs,albumsongsname),'mysongs': mysongs, 'albumsongsname':albumsongsname })

def show_playlists(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        mysongs = playlist.objects.filter(profiles_id=user_id.id).order_by('playlist_name').values('playlist_name').distinct()
        playlist_count = mysongs.count()
        playlist_count_dict = dict()

        for i in range(playlist_count):
            tempPlaylistName = mysongs[i]['playlist_name']
            total_song = playlist.objects.filter(playlist_name=tempPlaylistName).count()


            art = playlist.objects.filter(playlist_name=tempPlaylistName).values('metadata_id')
            artCounter = art.count()
            photo_dict = dict()
            for j in range(artCounter):
                tempArtFile = art[j]['metadata_id']
                artwork_name = metadata.objects.get(id=tempArtFile).artwork_name
                photo_dict[j] = artwork_name
            playlist_count_dict[tempPlaylistName] = total_song, photo_dict

        lastadded = playlist.objects.filter(profiles_id=user_id.id).order_by('date_created')[:4].values()
        lastaddedCounter= lastadded.count()
        lastadded_photo_dict = dict()
        for i in range(lastaddedCounter):
            tempArtFile = lastadded[i]["metadata_id"]
            artwork_name = metadata.objects.get(id=tempArtFile).artwork_name
            lastadded_photo_dict[i] = artwork_name

        related_music_dict = dict()
        related_music_Artwork_dict = dict()
        related_music = recent.objects.filter(profiles_id=user_id).values('metadata_id')
        related_musicCount = related_music.count()
        for i in range(related_musicCount):
            tempID = related_music[i]['metadata_id']
            tempGenre = metadata.objects.filter(id=tempID).values_list('genre', flat=True)
            genr= tempGenre[0]
            getsimilar = metadata.objects.filter(genre=genr).values_list('id', flat=True)


            for j in range(getsimilar.count()):
                metadataID = getsimilar[j]
                title = metadata.objects.filter(id=metadataID).values_list('title', flat=True)
                tempArtwork = metadata.objects.filter(id=metadataID).values_list('artwork_name', flat=True)
                related_music_Artwork_dict[tempArtwork[0]] = "relatedImage"
                related_music_dict[title[0]]= "related"

        related_music_Artwork_dict_LIST = list(related_music_Artwork_dict)


        favourites = favourite.objects.filter(profiles_id=user_id.id).order_by('date_added')[:4].values()
        favouritesCounter= favourites.count()
        favourites_photo_dict = dict()
        for i in range(favouritesCounter):
            tempArtFile = favourites[i]["metadata_id"]
            artwork_name = metadata.objects.get(id=tempArtFile).artwork_name
            favourites_photo_dict[i] = artwork_name
        TotalFav = favourite.objects.filter(profiles_id=user_id.id).count()


    return render(request, 'libraryplaylists.html', {'mysongs': mysongs, 'playlist_count_dict':playlist_count_dict,
                     'lastadded':lastadded, 'lastadded_photo_dict':lastadded_photo_dict,
                    'related_music_dict':related_music_dict, 'related_music_Artwork_dict':related_music_Artwork_dict,
                    'related_music_Artwork_dict_LIST':related_music_Artwork_dict_LIST, 'favourites_photo_dict':favourites_photo_dict,
                    'TotalFav':TotalFav})

def show_signin(request):
    return render(request, 'signin.html')

def show_signup(request):
    return render(request, 'signup.html')

def signindata(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']

        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            messages.info(request, ("Signin Successful"))
            return redirect('/library')
        elif User.objects.filter(username=username).exists():
            fgtpass = "Forgot Password?"
            notitype = "error"
            messages.info(request,("Password does not match"))
            return render(request, 'signin.html',{'fgtpass':fgtpass, 'notitype':notitype})
        else:
            value = 'signup'
            return render(request, 'signup.html',{'username': username, 'password': password, 'value':value})

    else:
        return render(request, "sign.html")

def signout(request):
    logout(request)
    notitype = "warning"
    messages.info(request, ("logged out successfully"))
    return redirect('../home', {'notitype': notitype})


def signupdata(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        email = request.POST['email']
        fname = request.POST['fname']
        lname = request.POST['lname']
        bday = request.POST['bday']
        gender = request.POST['gender']

        if User.objects.filter(email=email).exists():
                notitype= "error"
                messages.info(request,("Email already taken"))
                return render(request, 'signup.html', {'notitype':notitype})

        elif User.objects.filter(username=username).exists():
            notitype = "error"
            messages.info(request, ("Username already taken"))
            return render(request, 'signup.html', {'notitype':notitype})

        else:
            form = User.objects.create_user(username=username, first_name=fname, last_name=lname, email=email, password=password)
            form.save()

            form2 = profiles(Username=username, FirstName=fname, LastName=lname, Email=email, Password=password, DoB=bday , Gender=gender)
            form2.save()
            notitype="notice"
            messages.info(request, ("Signup successful"))
            return render(request, 'signin.html', {'notitype':notitype})

    return render(request, 'signup.html')

def forgotpassword(request):
    return render(request, 'forgotpassword.html')

def forgotpasswordwerifyemail(request):
    if request.method == "POST":
        email = request.POST['email']
        if User.objects.filter(email=email).exists():

            # setting other validity to 0
            disable = recovery_keys.objects.filter(email=email, valid= 1)
            disable.update(valid = 0)

            token= str(random.randrange(1, 99999999, 3))
            form = recovery_keys(email=email,token=token)
            form.save()

            subject = "Control : Password Recovery Instruction"
            message = "Hi there,You have requested for your password recovery. Click link to reset your password. http://127.0.0.1:8000/newpassword/"+email+"/"+token
            send_mail(subject, message, settings.EMAIL_HOST_USER, [email], fail_silently=False)
            notitype = "notice"
            messages.info(request, ("Password reset request send to mail. If not found please check on spam."))
            return render(request, "forgotpassword.html", {'notitype':notitype})
        else:
            notitype="error"
            messages.info(request, ("Email does not exists."))
            return render(request,"forgotpassword.html", {'notitype':notitype})
    return render(request,"forgotpassword.html")


def newpassword(request,email,token):
    if recovery_keys.objects.get(token=token):
        validity = recovery_keys.objects.get(token=token)
        if validity.valid == 1:
            return render(request, "newpassword.html",{"email":email,"token":token})
        else:
            notitype = "error"
            messages.info(request, ("Opps! The link you have come with is maybe broken or already used. Please Request password again."))
            message ="Opps! The link you have come with is maybe broken or already used. Please Request password again."
        return render(request, "newpassword.html",{'message':message, 'notitype':notitype})

def confirmnewpassword(request):
    if request.method == "POST":
        email = request.POST['email']
        token = request.POST['token']
        password = request.POST['password']
        confirmpassword = request.POST['confirmpassword']
        if password == confirmpassword:
            validity = recovery_keys.objects.get(token=token)
            if validity.valid == 1 and validity.email == email:
                u = User.objects.get(email__exact=email)
                u.set_password(password)
                u.save()

                form = profiles.objects.get(Email=email)
                form.Password = password
                form.save()

                disable = recovery_keys.objects.get(email=email, valid=1)
                disable.valid = 0
                disable.save()

            notitype="notice"
            messages.info(request,("Password changed. Now you can signin"))
            return redirect('/', {'notitype':notitype})
        else:
            messages.info(request, ("Password not same."))
            return redirect('/newpassword/'+email+'/'+token)
    else:
        messages.info(request, ("Not found."))
    return redirect('/signin')

def upload(request):
    return render(request, 'upload.html')

def uploadmusic(request):
    if request.method == "POST":
        music = request.FILES['uploadFile[]']

        # random number
        random_number = str(random.randrange(1, 999, 3))

        uploadby = request.user.get_username()

        fs = FileSystemStorage();
        music_rename=random_number+"_music_"+music.name;
        #     upload the music name, file
        fs.save('tmp/musics/'+music_rename, music)

        tag = TinyTag.get('static/tmp/musics/'+music_rename, image=True)

        contributing_artists = tag.artist
        album = tag.album
        genre = tag.genre
        length = tag.duration
        allyear = str(tag.year)
        year = allyear.split("-")[0]
        size = tag.filesize
        track_no = tag.track
        track_total = tag.track_total
        album_artist = str(tag.albumartist)
        title = tag.title
        bitrate = tag.bitrate
        samplerate = tag.samplerate

        # converting length into time
        length1 = divmod(length, 60)
        song_lengtha = str(length1[0]).split('.')[0]
        song_lengthb = str(length1[1]).split('.')[0]
        song_length = song_lengtha + ':' + song_lengthb

        artwork_name_tmp =album_artist+'_'+album+'_'+title+'_'+random_number+'.'+'jpg'
        artwork_name = artwork_name_tmp.translate({ord(c): None for c in string.whitespace})

        image_data = tag.get_image()
        with open("static/tmp/images/" + artwork_name, "wb") as f:
            f.write(image_data)



        image = Image.open('static/tmp/images/' + artwork_name)
        # ImageOps compatible mode
        if image.mode not in ("L", "RGB"):
            image = image.convert("RGB")
        imageresize = image.resize((300, 300), Image.ANTIALIAS)
        imageresize.save('static/thumbnails/'+artwork_name, 'JPEG', quality=75)

        extension = music_rename.split(".")[-1]
        filename_tmp = album_artist+'_'+album+'_'+title+'_'+random_number+'.'+extension
        filename =filename_tmp.translate({ord(c): None for c in string.whitespace})

        fs.save('musics/'+filename, music)

        # spotify explicit or not
        sp = spotipy.Spotify(client_credentials_manager=SpotifyClientCredentials())

        results = sp.search(q= title +' ' + album_artist + ':', type='track')
        items = results['tracks']['items']
        if len(items) > 0:
            explicit = items[0]['explicit']


        form = metadata(artwork_name=artwork_name, file=filename , album_artist=album_artist, contributing_artists=contributing_artists, album=album,
                        genre=genre, explicit= explicit,  length=song_length, size=size, track_no=track_no, track_total=track_total,  title=title, bitrate=bitrate, samplerate=samplerate, year=year)
        form.save()

        try:
            # for albums database
            albumandartist = albums.objects.get(album_artist=album_artist,album=album)
            if album_artist in albumandartist.album_artist and album in albumandartist.album :
                messages.info(request, ("Already has Data in Album."))
            else:
                form2 = albums(artwork_name=artwork_name, album_artist=album_artist, album=album, year=year)
                form2.save()

        except:
            form2 = albums(artwork_name=artwork_name, album_artist=album_artist, album=album, year=year)
            form2.save()

        try:
            # for artists database
            artistdata = artist.objects.get(artist_name=album_artist)
            if album_artist in artistdata.artist_name :
                messages.info(request, ("Already Registeren in Artists."))
            else:
                form3 = artist(artist_name=album_artist)
                form3.save()
        except:
            # # for artist image web scraping
            # BASE_ARTIST_URL = 'https://www.shutterstock.com/search/{}?image_type=photo&orientation=vertical'
            # search_artist = album_artist
            # models.artist_search.objects.create(search=search_artist)
            # final_url = BASE_ARTIST_URL.format(quote_plus(search_artist))
            # headers = {
            #     'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}
            # response = requests.get(final_url, headers=headers)
            # data = response.text
            # soup = BeautifulSoup(data, features='html.parser')
            # post_listing = soup.find_all('img', {'class': 'z_h_c'})
            # post_url = post_listing[0].get('src')

            sp = spotipy.Spotify(client_credentials_manager=SpotifyClientCredentials())

            results = sp.search(q=album_artist+':', type='artist')
            items = results['artists']['items']
            if len(items) > 0:
                artist1 = items[0]
                artist_image = (artist1['name'], artist1['images'][0]['url'])
                artist_image_url = artist_image[1]

            # for downloading artist images
            # List of images to download
            image_urls = [
                artist_image_url
            ]

            for image_url in image_urls:
                # Steam the image from the url
                request = requests.get(image_url, stream=True)

                # Was the request OK?
                if request.status_code != requests.codes.ok:
                    # Nope, error handling, skip file etc etc etc
                    continue

                # Get the filename from the url, used for saving later
                file_name = random_number + image_url.split('/')[-1] +'.jpg'

                # Create a temporary file
                lf = tempfile.NamedTemporaryFile()

                # Read the streamed image in sections
                for block in request.iter_content(1024 * 8):

                    # If no more file then stop
                    if not block:
                        break

                    # Write image block to temporary file
                    lf.write(block)

                # Create the model you want to save the image to
                image = artist(artist_image=album_artist)

                # Save the temporary image to the model#
                # This saves the model so be sure that is it valid
                image.artist_image.save(file_name, files.File(lf))

                # resizing downloaded image
                image = Image.open('static/tmp/artist/'+file_name)
                # ImageOps compatible mode
                if image.mode not in ("L", "RGB"):
                    image = image.convert("RGB")
                imageresize = ImageOps.fit(image, (300, 300), Image.ANTIALIAS)
                artist_img = album_artist+ random_number + '.jpg'
                imageresize.save('static/artist_image/' + artist_img, 'JPEG', quality=75)

                form3 = artist.objects.get(artist_image='tmp/artist/' + file_name)
                form3.artist_name = album_artist
                form3.artist_img_original = artist_img
                form3.save()

        albumcounting = albums.objects.filter(album_artist=album_artist).count()
        form4 = artist.objects.get(artist_name=album_artist)
        form4.total_album = albumcounting
        form4.save()
        return redirect("../upload")
    else:
        return render(request, "upload.html")

def createplaylist(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        recentdata = recent.objects.filter(profiles_id=user_id.id)
        return render(request, 'createplaylist.html', {'recentdata': recentdata})
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype': notitype})

def createplaylistdata(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        if request.method == "POST":
            playlistname = request.POST['playlistname']
            c1 = request.POST['c1']
            c2 = request.POST['c2']
            c3 = request.POST['c3']
            c4 = request.POST['c4']
            c5 = request.POST['c5']
            c6 = request.POST['c6']
            c7 = request.POST['c7']
            c8 = request.POST['c8']
            c9 = request.POST['c9']
            c10 = request.POST['c10']
            c11= request.POST['c11']
            c12= request.POST['c12']
            if c1 != '0':
                recentdata = recent.objects.get(id=c1)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c2 != '0':
                recentdata = recent.objects.get(id=c2)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c3 != '0':
                recentdata = recent.objects.get(id=c3)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c4 != '0':
                recentdata = recent.objects.get(id=c4)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c5 != '0':
                recentdata = recent.objects.get(id=c5)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c6 != '0':
                recentdata = recent.objects.get(id=c6)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c7 != '0':
                recentdata = recent.objects.get(id=c7)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c8 != '0':
                recentdata = recent.objects.get(id=c8)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c9 != '0':
                recentdata = recent.objects.get(id=c9)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c10 != '0':
                recentdata = recent.objects.get(id=c10)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c11 != '0':
                recentdata = recent.objects.get(id=c11)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()
            if c12 != '0':
                recentdata = recent.objects.get(id=c12)
                form1 = playlist(playlist_name=playlistname, profiles_id=recentdata.profiles_id, albums_id=recentdata.albums_id, artist_id=recentdata.artist_id, metadata_id=recentdata.metadata_id )
                form1.save()

        return redirect('/library')
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype': notitype})

def search_data(request):
    if request.method == 'POST':
        search_text = request.POST['search_text']
        if search_text == '':
            return redirect('/home')
    else:
        search_text = ''

    Searched_song = metadata.objects.filter(title__icontains=search_text)
    Searched_album = metadata.objects.filter(album__icontains=search_text)
    Searched_artist = artist.objects.filter(artist_name__icontains=search_text)
    Searched_playlist = playlist.objects.filter(playlist_name__icontains=search_text).values('playlist_name').distinct()

    plstNameTot = dict()
    searched_photo_dict = dict()
    if Searched_playlist:
        counteri = Searched_playlist.count()
        for i in range(counteri):
            playlistName = Searched_playlist[i]['playlist_name']
            total_song = playlist.objects.filter(playlist_name=playlistName).count()
            plstNameTot[playlistName]= total_song
            metadataID = playlist.objects.filter(playlist_name=playlistName).values('metadata_id')
            counterj = metadataID.count()
            for j in range(counterj):
                metadataID1 = metadataID[j]['metadata_id']
                artwork_name = metadata.objects.get(id=metadataID1).artwork_name
                searched_photo_dict[j] = artwork_name
    print(searched_photo_dict)

    return render(request, 'searches.html', {'Searched_song': Searched_song, 'Searched_album': Searched_album,
                'Searched_artist' : Searched_artist, 'Searched_playlist':Searched_playlist,
                'searched_photo_dict': searched_photo_dict, 'plstNameTot':plstNameTot})


def findSongbyalbum (request):
    return redirect('/top')

def viewplaylist(request,PlaylistName):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        plstdata = playlist.objects.filter(profiles_id=user_id.id , playlist_name=PlaylistName)
        return render(request, 'playlistview.html', {'PlaylistName':PlaylistName,'plstdata':plstdata})
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype': notitype})

def autoviewplaylist(request,PlaylistName):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        if PlaylistName == "Last Added":
            plstdata = playlist.objects.filter(profiles_id=user_id.id).order_by('date_created')
            return render(request, 'playlistview.html', {'PlaylistName':PlaylistName,'plstdata':plstdata})

        if PlaylistName == 'Favourite':
            plstdata = favourite.objects.filter(profiles_id=user_id.id).order_by('date_added')
            return render(request, 'playlistview.html', {'PlaylistName': PlaylistName, 'plstdata': plstdata})

        if PlaylistName == "Related Musics":
            All_related_music_dict = dict()
            related_music_dict = dict()
            related_music_Artwork_dict = dict()
            related_music = recent.objects.filter(profiles_id=user_id).values('metadata_id')
            related_musicCount = related_music.count()
            for i in range(related_musicCount):
                tempID = related_music[i]['metadata_id']
                tempGenre = metadata.objects.filter(id=tempID).values_list('genre', flat=True)
                genr = tempGenre[0]
                getsimilar = metadata.objects.filter(genre=genr).values_list('id', flat=True)

                for j in range(getsimilar.count()):
                    metadataID = getsimilar[j]
                    allData = metadata.objects.filter(id=metadataID)
                    All_related_music_dict[allData[0]] = "allData"

            return render(request, 'playlistview.html', {'PlaylistName': PlaylistName,
                                                         'All_related_music_dict':All_related_music_dict})
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype': notitype})

def GoToView(request,topic):
    if topic == 'Weekly Top 15':
        topsong = metadata.objects.order_by('-total_played')
        return render(request, 'view.html', {'topic': topic, 'topsong': topsong})
    else:
        albumview= metadata.objects.filter(album=topic).order_by('track_no')
        return render(request, 'view.html', {'topic': topic,'albumview': albumview})


def artistview(request,topic):
    artistdata = artist.objects.filter(artist_name=topic).order_by('-total_played')
    albumdata = albums.objects.filter(album_artist=topic).order_by('-year')
    meta = metadata.objects.filter(album_artist=topic).order_by('-year')
    return render(request, 'artistview.html', {'topic': topic, 'artistdata':artistdata, 'albumdata':albumdata, 'meta':meta })


def viewPublicplaylist(request,PlaylistName):
    plstdata = playlist.objects.filter(playlist_name=PlaylistName)
    public = "public"
    return render(request, 'playlistview.html', {'PlaylistName':PlaylistName,'plstdata':plstdata, 'public':public})

def favourited(request,ArtworkName):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username= username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        getMetadataId = metadata.objects.filter(artwork_name=ArtworkName).values('id')
        MetadataId = getMetadataId[0]['id']
        # if exist then delete else insert and message removed from fav
        checkifexist = favourite.objects.filter(profiles_id=Profiles_id,metadata_id=MetadataId)
        if not checkifexist:
            form = favourite( profiles_id=Profiles_id, metadata_id=MetadataId,)
            form.save()
            return HttpResponse("Added to favourite")
        else:
            form = favourite.objects.get( profiles_id=Profiles_id, metadata_id=MetadataId,)
            form.delete()
            return HttpResponse("Removed from favourite")
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype': notitype})

def favyesorno(request,ArtworkName):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username=username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        getMetadataId = metadata.objects.filter(artwork_name=ArtworkName).values('id')
        MetadataId = getMetadataId[0]['id']

        # fav yes or no
        checkifexist = favourite.objects.filter(profiles_id=Profiles_id, metadata_id=MetadataId)
        if not checkifexist:
            return HttpResponse("no")
        else:
            return HttpResponse("yes")
    else:
        return redirect("/")
    
def addlibview(request,ArtworkName):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username=username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        myplaylist = playlist.objects.filter(profiles_id=Profiles_id).order_by('playlist_name').values_list('playlist_name', flat=True).distinct()

        getMetadataId = metadata.objects.filter(artwork_name=ArtworkName).values('id')
        MetadataId = getMetadataId[0]['id']
        check = playlist.objects.filter(profiles_id=Profiles_id,metadata_id=MetadataId).values_list('playlist_name', flat=True).distinct()

        json_dict = dict()
        for i in range(myplaylist.count()):
            json_dict[myplaylist[i]] = 0
            for j in range(check.count()):
                if myplaylist[i] == check[j]:
                    json_dict[myplaylist[i]] = 1

        checkLib = library.objects.filter(profiles_id=Profiles_id, metadata_id=MetadataId)
        if not checkLib:
            oneORzero = 0
        else:
            oneORzero = 1
        json_dict["Library"] = oneORzero
        return HttpResponse(json.dumps(json_dict), content_type='application/json')
    else:
        return HttpResponse("please sign in first")

def addlib(request,PlaylistName,ArtworkName):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username=username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        getMetadataId = metadata.objects.filter(artwork_name=ArtworkName).values('id')
        MetadataId = getMetadataId[0]['id']
        ArtistName = metadata.objects.filter(artwork_name=ArtworkName).values('album_artist')[0]['album_artist']
        ArtistId = artist.objects.filter(artist_name=ArtistName).values('id')[0]['id']
        AlbumName =  metadata.objects.filter(artwork_name=ArtworkName).values('album')[0]['album']
        AlbumsId = albums.objects.filter(album=AlbumName).values('id')[0]['id']
        if PlaylistName == "Library":
            checkifexist = library.objects.filter(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId,)
            if not checkifexist:
                form = library(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId)
                form.save()
                return HttpResponse("Added")
            else:
                form = library.objects.get(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId)
                form.delete()
                return HttpResponse("Removed")
        else:
            checkifexist = playlist.objects.filter(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId, playlist_name=PlaylistName)
            if not checkifexist:
                form = playlist(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId, playlist_name=PlaylistName)
                form.save()
                return HttpResponse("Added")
            else:
                form = playlist.objects.get(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId, playlist_name=PlaylistName)
                form.delete()
                return HttpResponse("Removed")
    else:
        return redirect("/")

def option(request,id):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username=username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        checkifexist = favourite.objects.filter(profiles_id=Profiles_id, metadata_id=id)
        if not checkifexist:
            return HttpResponse("no")
        else:
            return HttpResponse("yes")
    else:
        return HttpResponse("no")

def favouriteOption(request,id):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username= username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        # if exist then delete else insert and message removed from fav
        checkifexist = favourite.objects.filter(profiles_id=Profiles_id,metadata_id=id)
        if not checkifexist:
            form = favourite( profiles_id=Profiles_id, metadata_id=id,)
            form.save()
            return HttpResponse("Added to favourite")
        else:
            form = favourite.objects.get( profiles_id=Profiles_id, metadata_id=id,)
            form.delete()
            return HttpResponse("Removed from favourite")
    else:
        notitype = "warning"
        messages.info(request, ("Please sign in to use this feature"))
        return render(request, 'signin.html', {'notitype':notitype})

def addOption(request,id):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username= username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        myplaylist = playlist.objects.filter(profiles_id=Profiles_id).order_by('playlist_name').values_list(
            'playlist_name', flat=True).distinct()
        check = playlist.objects.filter(profiles_id=Profiles_id, metadata_id=id).values_list('playlist_name',
                                                                                                     flat=True).distinct()
        json_dict = dict()
        for i in range(myplaylist.count()):
            json_dict[myplaylist[i]] = 0
            for j in range(check.count()):
                if myplaylist[i] == check[j]:
                    json_dict[myplaylist[i]] = 1

        checkLib = library.objects.filter(profiles_id=Profiles_id, metadata_id=id)
        if not checkLib:
            oneORzero = 0
        else:
            oneORzero = 1
        json_dict["Library"] = oneORzero
        return HttpResponse(json.dumps(json_dict), content_type='application/json')
    else:
        return HttpResponse("please sign in first")

def AddLibFrmDetails(request,PlaylistName,id):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username=username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        MetadataId = id
        ArtistName = metadata.objects.filter(id=id).values('album_artist')[0]['album_artist']
        ArtistId = artist.objects.filter(artist_name=ArtistName).values('id')[0]['id']
        AlbumName =  metadata.objects.filter(id=id).values('album')[0]['album']
        AlbumsId = albums.objects.filter(album=AlbumName).values('id')[0]['id']
        if PlaylistName == "Library":
            checkifexist = library.objects.filter(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId,)
            if not checkifexist:
                form = library(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId)
                form.save()
                return HttpResponse("Added")
            else:
                form = library.objects.get(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId)
                form.delete()
                return HttpResponse("Removed")
        else:
            checkifexist = playlist.objects.filter(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId, playlist_name=PlaylistName)
            if not checkifexist:
                form = playlist(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId, playlist_name=PlaylistName)
                form.save()
                return HttpResponse("Added")
            else:
                form = playlist.objects.get(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId, playlist_name=PlaylistName)
                form.delete()
                return HttpResponse("Removed")
    else:
        return redirect("/")

def removeFromLib(request,id):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username= username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        form = library.objects.get(profiles_id=Profiles_id, metadata_id=id)
        form.delete()
        return redirect('/songs')
    else:
        return HttpResponse("please sign in first")

def removeFromPlst(request,playlistName,id):
    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username= username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        form = playlist.objects.get(profiles_id=Profiles_id, metadata_id=id,playlist_name=playlistName)
        form.delete()
        return redirect('/playlists')
    else:
        return HttpResponse("please sign in first")

def recentANDcount(request,ArtworkName):
    getMetadataId = metadata.objects.filter(artwork_name=ArtworkName).values('id')
    MetadataId = getMetadataId[0]['id']
    getAlbumsName = metadata.objects.filter(id=MetadataId).values('album')[0]['album']
    getAlbumsId = albums.objects.filter(album=getAlbumsName).values('id')
    AlbumsId = getAlbumsId[0]['id']
    getArtistName = metadata.objects.filter(id=MetadataId).values('album_artist')[0]['album_artist']
    getArtistId = artist.objects.filter(artist_name=getArtistName).values('id')
    ArtistId = getArtistId[0]['id']
    # add total played count metadata, artist, album
    getMetadataTot = metadata.objects.filter(id=MetadataId).values('total_played')[0]['total_played']
    if getMetadataTot is None:
        getMetadataTot = 0
    added = getMetadataTot + 1
    forma = metadata.objects.get(id=MetadataId)
    forma.total_played=added
    forma.save()

    if request.user.is_authenticated:
        username = request.user.username
        getProfiles_id = profiles.objects.filter(Username=username).values('id')
        Profiles_id = getProfiles_id[0]['id']
        # to add in recent
        form = recent(profiles_id=Profiles_id, metadata_id=MetadataId, artist_id=ArtistId, albums_id=AlbumsId, )
        form.save()
        return HttpResponse("Done")
    else:
        return HttpResponse("please sign in first")