# Generated by Django 3.0.5 on 2020-04-20 14:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0044_artist_artist_img_original'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='albums',
            options={'verbose_name_plural': 'Albums'},
        ),
        migrations.AddField(
            model_name='albums',
            name='total_album',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
