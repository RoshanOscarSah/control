from django.contrib import admin
from .models import metadata, albums, artist, artist_search

admin.site.register(metadata)
admin.site.register(albums)
admin.site.register(artist)
admin.site.register(artist_search)

