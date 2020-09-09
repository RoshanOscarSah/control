from django.db import models
import datetime

# Create your models here.
class profiles(models.Model):
    Username = models.CharField(max_length=50)
    FirstName = models.CharField(max_length=50)
    LastName = models.CharField(max_length=50)
    Email = models.CharField(max_length=50)
    Password = models.CharField(max_length=50)
    DoB = models.CharField(max_length=50)
    Gender = models.CharField(max_length=50)

class recovery_keys(models.Model):
    email = models.CharField(max_length=50)
    token = models.IntegerField()
    valid = models.IntegerField(default=1)
    date = models.DateField(("Date"), default=datetime.date.today)

class metadata(models.Model):
    artwork_name = models.CharField(max_length=100, null=True)
    contributing_artists = models.CharField(max_length=50, null=True) #tag.artist
    album = models.CharField(max_length=50, null=True)
    samplerate = models.CharField(max_length=50, null=True)    #44.1 kHz
    genre = models.CharField(max_length=50, null=True)    #tag.genre
    length = models.CharField(max_length=50, null=True) #tag.duration
    year = models.CharField(max_length=50, null=True)
    size = models.IntegerField(null=True)    #tag.filesize
    track_no = models.CharField(max_length=50, null=True, default=1)
    track_total = models.CharField(max_length=50, null=True)
    album_artist = models.CharField(max_length=50, null=True)
    title = models.CharField(max_length=50, null=True)
    bitrate = models.CharField(max_length=50, null=True)
    date_modified = models.DateField(("Date"), default=datetime.date.today)
    explicit = models.CharField(max_length=50, default='False')
    file = models.FileField(upload_to='', null=True)
    total_played = models.IntegerField( null=True, default=0)

    def __str__(self):
        return self.title

class albums(models.Model):
    artwork_name = models.CharField(max_length=100, null=True)
    album = models.CharField(max_length=50, null=True)
    album_artist = models.CharField(max_length=50, null=True)
    year = models.CharField(max_length=50, null=True)
    date_modified = models.DateField(("Date"), default=datetime.date.today)
    total_played = models.IntegerField(null=True, default=0)

    class Meta:
        verbose_name_plural ='Albums'

    def __str__(self):
        return self.album

class artist(models.Model):
    artist_name = models.CharField(max_length =50, null=True)
    artist_image = models.ImageField(upload_to='tmp/artist',)
    artist_img_original = models.CharField(max_length=100, null=True)
    date_modified = models.DateField(("Date"), default=datetime.date.today)
    total_album = models.CharField(max_length=50, null=True)
    total_played = models.IntegerField( null=True, default=0)

    def __str__(self):
        return self.artist_name

class artist_search(models.Model):
    search = models.CharField(max_length=500)
    created = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural ='Searches'

    def __str__(self):
        return '{}'.format(self.search)

class library(models.Model):
    profiles = models.ForeignKey(profiles, on_delete=models.CASCADE)
    metadata = models.ForeignKey(metadata, on_delete=models.CASCADE)
    artist = models.ForeignKey(artist, on_delete=models.CASCADE)
    albums = models.ForeignKey(albums, on_delete=models.CASCADE)
    date_added = models.DateField(("Date"), default=datetime.date.today)

class recent(models.Model):
    profiles = models.ForeignKey(profiles, on_delete=models.CASCADE)
    metadata = models.ForeignKey(metadata, on_delete=models.CASCADE)
    artist = models.ForeignKey(artist, on_delete=models.CASCADE)
    albums = models.ForeignKey(albums, on_delete=models.CASCADE)
    date_added = models.DateField(("Date"), default=datetime.date.today)

class playlist(models.Model):
    playlist_name = models.CharField(max_length=50, null=True)
    profiles = models.ForeignKey(profiles, on_delete=models.CASCADE)
    metadata = models.ForeignKey(metadata, on_delete=models.CASCADE)
    artist = models.ForeignKey(artist, on_delete=models.CASCADE)
    albums = models.ForeignKey(albums, on_delete=models.CASCADE)
    date_created = models.DateField(("Date"), default=datetime.date.today)
    total_played = models.IntegerField(null=True, default=0)

class favourite(models.Model):
    profiles = models.ForeignKey(profiles, on_delete=models.CASCADE)
    metadata = models.ForeignKey(metadata, on_delete=models.CASCADE)
    date_added = models.DateField(("Date"), default=datetime.date.today)