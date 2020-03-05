import "bootstrap";
import { clickTags } from '../components/form_profile_activities_clickable_tags';


clickTags();


import { searchMovie } from '../components/search_movie';
searchMovie();


import { activateTagsOnLoad } from '../components/activate_tags_edit_open';

import { scrollLastMessageIntoView } from '../components/scroll';
scrollLastMessageIntoView();

window.addEventListener("load",activateTagsOnLoad)

import { stepsEdit } from '../components/steps_edit_profile';
stepsEdit();

import { smileySelection } from '../components/smiley_selection';
smileySelection();

import { percentageAnimation } from '../components/percentage'
window.addEventListener("load", percentageAnimation)

import {fillRange} from '../components/fill_range';
fillRange();

import { addGif } from '../components/gif_edit_profile';
addGif();

import { selectSmileyAnswer } from '../components/smiley_question';
selectSmileyAnswer();

import { selectLike } from '../components/like_question';
selectLike();

import { selectMbti } from '../components/selectMbti';
selectMbti();

import { stepsCreate } from '../components/steps_create_user'
stepsCreate();

import { AnimateJauge } from '../components/jauge';
AnimateJauge();

