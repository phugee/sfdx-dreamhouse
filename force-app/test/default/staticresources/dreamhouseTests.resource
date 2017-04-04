describe('Property Explorer Tests', function(){

    afterEach(function() {
    	$LightningTestUtil.clearRenderedTestComponents();
    });

    /*describe('c:PropertyListHeader', function(){
        it('renders expected title', function(done) {
            var renderInto = document.getElementById('renderTestComponents');
            $LightningTestUtil.getComponent('c:PropertyListHeader', {}, renderInto)
                .then(function(component) {
                    expect(document.getElementById('title').textContent).toContain('Property Explorer');
                    done();
                }).catch(function(e) {
                    done.fail(e);
                });
        });
    });*/

    describe('c:PropertyList', function(){
        it('renders expected number of properties display', function(done) {
            var renderInto = document.getElementById('renderTestComponents');
            $LightningTestUtil.getComponent('c:PropertyList', {}, renderInto)
                .then(function(component) {
                    // TODO: init component to load all properties
                    expect(component.get('v.properties').length).toBe(0);
                    done();
                }).catch(function(e) {
                    done.fail(e);
                });
        });
    });
});
