import _ from 'lodash';
import Vue from 'vue';

Vue.filter('percent', (value) => {
  if (!value) value = 0;

  const rounded = Math.round(value * 100) / 100;
  return `${rounded.toFixed(2)}%`;
});

Vue.filter('shortNumber', (value) => {
  if (value < 1000) {
    return value;
  }

  if (value < 1000000) {
    return `${Math.floor(value / 1000)}k`;
  }

  return `${Math.floor(value / 1000000)}M`;
});

Vue.filter('titleize', sentence => _.join(_.map(_.words(sentence), word => _.capitalize(word)), ' '));

Vue.filter('escape', value => _.escape(value));

Vue.filter('removeHtml', value => value.replace(/<\/?[^>]+(>|$)/g, ''));

Vue.filter('dynamicShortNumber', (value, diff) => {
  if (diff < 1000 || value < 1000) {
    return Vue.filter('numeral')(value);
  }

  if (diff < 1000000 || value < 1000000) {
    return `${Vue.options.filters.numeral(Math.floor(value * 10 / 1000) / 10, '0.[0]')}k`;
  }

  return `${Vue.options.filters.numeral(Math.floor(value * 10 / 1000000) / 10, '0.[0]')}M`;
});
