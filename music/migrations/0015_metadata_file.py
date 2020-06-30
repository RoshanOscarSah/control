# Generated by Django 3.0.5 on 2020-04-18 03:10

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0014_delete_song'),
    ]

    operations = [
        migrations.AddField(
            model_name='metadata',
            name='file',
            field=models.FileField(default=django.utils.timezone.now, upload_to='musics/'),
            preserve_default=False,
        ),
    ]
