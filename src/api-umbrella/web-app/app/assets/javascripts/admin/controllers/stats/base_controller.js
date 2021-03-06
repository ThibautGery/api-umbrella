Admin.StatsBaseController = Ember.ObjectController.extend({
  needs: ['application'],

  query: null,

  actions: {
    submit: function() {
      var query = this.get('query');
      query.beginPropertyChanges();

      if($('#filter_type_advanced').css('display') === 'none') {
        query.set('params.search', '');
        query.set('params.query', JSON.stringify($('#query_builder').queryBuilder('getRules')));
      } else {
        query.set('params.query', '');
        query.set('params.search', $('#filter_form input[name=search]').val());
      }

      query.endPropertyChanges();
    },
  },
});
