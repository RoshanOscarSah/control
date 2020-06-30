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
from music.models import profiles, metadata, recovery_keys, albums, artist, artist_search, library, recent , playlist
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

    # data1 = artist.objects.order_by('-id')[:1].get()
    # albumdata = albums.objects.filter(album_artist= data1).count()  # kept just for example
    return render(request, 'index.html', {'newandtrending': newandtrending, 'youmightalsolike': youmightalsolike,
                                         'bestofartists': bestofartists, 'albumsongsname':albumsongsname,})

def show_home(request):
    newandtrending = albums.objects.order_by('-year')
    youmightalsolike = metadata.objects.order_by('genre')
    bestofartists = artist.objects.order_by('-total_played')
    return render(request, 'home.html', {'newandtrending': newandtrending, 'youmightalsolike': youmightalsolike,
                                          'bestofartists': bestofartists})

def show_top(request):
    topsong = metadata.objects.order_by('-total_played')
    topalbum = albums.objects.order_by('-total_played')
    return render(request, 'top.html', {'topsong':topsong,'topalbum':topalbum})

def show_new(request):
    newandtrending = albums.objects.order_by('-year')
    newalbumsandsingles = albums.objects.order_by('date_modified')
    return render(request, 'new.html',{'newandtrending': newandtrending, 'newalbumsandsingles':newalbumsandsingles})

def show_recent(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        recentdata = recent.objects.filter(profiles_id=user_id.id)
        return render(request, 'recent.html', {'recentdata' :recentdata})
    else:
        return render(request, 'signin.html')

def show_library(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        mysongs = library.objects.filter(profiles_id=user_id.id)
        return render(request, 'library.html', {'mysongs':mysongs})
    else:
        return render(request, 'signin.html')

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
    return render(request, 'libraryalbums.html', {'mysongs': mysongs, })

def show_playlists(request):
    if request.user.is_authenticated:
        username = request.user.username
        user_id = profiles.objects.get(Username=username)
        mysongs = playlist.objects.filter(profiles_id=user_id.id).order_by('playlist_name').values('playlist_name').distinct()
    return render(request, 'libraryplaylists.html', {'mysongs': mysongs, })

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
            return render(request, 'signup.html',{'username': username, 'password': password})

    else:
        return render(request, "sign.html")

def signout(request):
    logout(request)
    notitype = "warning"
    messages.info(request, ("logged out successfully"))
    return redirect('/show_home', {'notitype': notitype})


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

            # subject = "NepaliGallery: Password Recovery Instruction"
            # html_message = render_to_string('email.html', {'context': 'values'})
            # plain_message = strip_tags(html_message)
            # message = "https://nepaligallery.com/newpassword/"+token
            # send_mail( subject, plain_message,settings.EMAIL_HOST_USER,[email],html_message=html_message,fail_silently=False)
            # messages.info(request, ("Password reset request send to mail. If not found please check on spam."))
            # return render(request, "resetpwd.html")

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
        return render(request, 'signin.html')

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
        return render(request, 'signin.html')

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

    return render(request, 'searches.html', {'Searched_song': Searched_song, 'Searched_album': Searched_album,
                                             'Searched_artist' : Searched_artist})


def findSongbyalbum (request):
    return redirect('/top')












