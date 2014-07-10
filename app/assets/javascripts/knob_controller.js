$(function($) {

                $(".knob").knob({
                    change : function (value) {
                        console.log("change : " + value);
                        $('#loc')[0].innerText = $('.knob').val()
                    },
                    release : function (value) {
                        // console.log(this.$.attr('value'));
                        // if (this.$[0].className == "knob playmusic") {console.log("success!")}
                        // debugger

                        if (this.$[0].className == "knob") {year_triggered = true;}

                        if (this.$[0].className == "knob playmusic") {

                            if(($.trim( $('.ival')[0].innerHTML ) != '') && year_triggered==true)
                                {playsong(event);}

                        console.log("release : " + value);
                    }
                    },
                    cancel : function () {
                        console.log("cancel : ", this);
                    },
                    /*format : function (value) {
                        return value + '%';
                    },*/
                    draw : function () {

                        // "tron" case
                        if(this.$.data('skin') == 'tron') {

                            this.cursorExt = 0.3;

                            var a = this.arc(this.cv)  // Arc
                                , pa                   // Previous arc
                                , r = 1;

                            this.g.lineWidth = this.lineWidth;

                            if (this.o.displayPrevious) {
                                pa = this.arc(this.v);
                                this.g.beginPath();
                                this.g.strokeStyle = this.pColor;
                                this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, pa.s, pa.e, pa.d);
                                this.g.stroke();
                            }

                            this.g.beginPath();
                            this.g.strokeStyle = r ? this.o.fgColor : this.fgColor ;
                            this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, a.s, a.e, a.d);
                            this.g.stroke();

                            this.g.lineWidth = 2;
                            this.g.beginPath();
                            this.g.strokeStyle = this.o.fgColor;
                            this.g.arc( this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
                            this.g.stroke();

                            return false;
                        }
                    }
                });

                // Example of infinite knob, iPod click wheel
                var v, up=0,down=0,i=0
                    ,$idir = $("div.idir")
                    ,$ival = $("div.ival")
                    ,incr = function() {if (i>= country_list.length) {i = 0}
                    else {i++; $idir.show().html("").fadeOut(); $ival.html(country_list[i]);} }
                    ,decr = function() {
                         if (i < 0) {i = country_list.length}
                            else{
                            i--; $idir.show().html("").fadeOut(); $ival.html(country_list[i]);
                        }
                    };
                $("input.infinite").knob(
                                    {
                                    min : 0
                                    , max : 20
                                    , stopper : false
                                    , change : function () {
                                                    if(v > this.cv){
                                                        if(up){
                                                            decr();
                                                            up=0;
                                                        }else{up=1;down=0;}
                                                    } else {
                                                        if(v < this.cv){
                                                            if(down){
                                                                incr();
                                                                down=0;
                                                            }else{down=1;up=0;}
                                                        }
                                                    }
                                                    v = this.cv;
                                                }
                                    });
            });