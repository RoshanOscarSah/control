# Generated by Django 3.0.5 on 2020-04-19 02:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0031_auto_20200418_1516'),
    ]

    operations = [
        migrations.CreateModel(
            name='album',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('artwork_name', models.CharField(max_length=100, null=True)),
                ('album', models.CharField(max_length=50, null=True)),
                ('album_artist', models.CharField(max_length=50, null=True)),
            ],
        ),
    ]
