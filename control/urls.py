"""control URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from music import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index),
    path('home', views.show_home),
    path('top', views.show_top),
    path('new', views.show_new),
    path('recent', views.show_recent),
    path('library', views.show_library),
    path('queue', views.show_queue),
    path('songs', views.show_songs),
    path('artists', views.show_artists),
    path('albums', views.show_albums),
    path('playlists', views.show_playlists),
    path('signin', views.show_signin),
    path('signup', views.show_signup),
    path('signout', views.signout),
    path('signindata', views.signindata),
    path('signupdata', views.signupdata),
    path('forgotpassword', views.forgotpassword),
    path('forgotpasswordwerifyemail', views.forgotpasswordwerifyemail),
    path('newpassword/<email>/<token>', views.newpassword),
    path('confirmnewpassword', views.confirmnewpassword),
    path('upload', views.upload),
    path('uploadmusic', views.uploadmusic),
    path('createplaylist', views.createplaylist),
    path('createplaylistdata', views.createplaylistdata),
    path('search_data', views.search_data),
    path('findSongbyalbum', views.findSongbyalbum),
    path('playlistview/<PlaylistName>', views.viewplaylist),
    path('autoplaylistview/<PlaylistName>', views.autoviewplaylist),
    path('view/<topic>', views.GoToView),
    path('artist/<topic>', views.artistview),
    path('public_playlist/<PlaylistName>', views.viewPublicplaylist),
    path('favourite/<ArtworkName>', views.favourited),
    path('favyesorno/<ArtworkName>', views.favyesorno),
    path('addlibview/<ArtworkName>', views.addlibview),
    path('addlib/<PlaylistName>/<ArtworkName>', views.addlib),
    path('option/<id>', views.option),
    path('favouriteOption/<id>', views.favouriteOption),
    path('addOption/<id>', views.addOption),
    path('AddLibFrmDetails/<PlaylistName>/<id>', views.AddLibFrmDetails),
    path('removeFromLib/<id>', views.removeFromLib),
    path('removeFromPlst/<playlistName>/<id>', views.removeFromPlst),
    path('recentANDcount/<ArtworkName>', views.recentANDcount),

]

urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)