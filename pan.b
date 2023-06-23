	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM repete */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM formula */
;
		;
		
	case 7: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC env */
;
		;
		
	case 9: // STATE 2
		;
		now.incr = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC counter */
;
		;
		
	case 12: // STATE 2
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 3
		;
		now.incr = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 5
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 9
		;
		p_restor(II);
		;
		;
		goto R999;
	}

